-- Recommended indexes for salesum table to optimize read queries
-- Targeted queries:
-- 1) getAllSales: WHERE sdate in range, paid > 0, (examount = 0 OR IS NULL), payvia not empty; ORDER BY sdate DESC, rno DESC
-- 2) getSalesumByRcno: WHERE rcno = ? ORDER BY sdate DESC
-- 3) getSalesumByDateRange: WHERE sdate >= ? AND sdate < ? ORDER BY sdate DESC, rno DESC

-- Note: In MySQL 8.0, DESC index order is supported and can improve ORDER BY performance.

-- Main covering order-by/range index for time-ordered scans
CREATE INDEX IF NOT EXISTS idx_salesum_sdate_rno ON salesum (sdate DESC, rno DESC);

-- For rcno lookups ordered by sdate
CREATE INDEX IF NOT EXISTS idx_salesum_rcno_sdate ON salesum (rcno, sdate DESC);

-- Optional: If you frequently filter by an exact payment method (payvia = ?)
-- then this composite index helps combine equality + time range + order by
-- (not used for payvia IS NOT NULL and payvia != '' conditions)
CREATE INDEX IF NOT EXISTS idx_salesum_payvia_sdate_rno ON salesum (payvia, sdate DESC, rno DESC);

-- Notes:
-- - Conditions on paid and examount are still filtered efficiently via Index Condition Pushdown
--   when scanning by time using idx_salesum_sdate_rno.
-- - Avoid wrapping sdate in functions (e.g., DATE(sdate)) so the range can use the index.
-- - Prefer half-open ranges for date filtering: sdate >= 'YYYY-MM-DD' AND sdate < DATE_ADD('YYYY-MM-DD', INTERVAL 1 DAY).

