SELECT theater_name,
       theater_city,
       hall,
       hall_id,
       hall_capacity,
       paid_tickets,
       occupancy_pct
FROM (
  SELECT t.theater_name,
         t.theater_city,
         h.hall,
         h.hall_id,
         h.hall_capacity,
         NVL(bc.paid_tickets, 0) AS paid_tickets,
         ROUND((NVL(bc.paid_tickets, 0) * 100.0) / h.hall_capacity, 2) AS occupancy_pct,
         ROW_NUMBER() OVER (ORDER BY (NVL(bc.paid_tickets, 0) * 1.0) / h.hall_capacity DESC) AS rn
  FROM HALL h
  JOIN THEATER t ON h.theater_id = t.theater_id
  LEFT JOIN (
    -- paid tickets per hall for the given movie
    SELECT s.hall_id,
           COUNT(*) AS paid_tickets
    FROM BOOKING b
    JOIN SHOW_SCHEDULE s ON b.show_schedule_id = s.show_schedule_id
    WHERE s.movie_id = :MOVIE_ID
      AND UPPER(b.status) = 'PAID'
    GROUP BY s.hall_id
  ) bc ON bc.hall_id = h.hall_id
  WHERE h.hall_capacity > 0
)
WHERE rn <= 3
ORDER BY occupancy_pct DESC;