CREATE TABLE amazon_access_audit (
    ACTION INT,               -- 1 = Approved, 0 = Denied
    RESOURCE BIGINT,          -- ID of the system/resource
    MGR_ID BIGINT,            -- ID of the manager
    ROLE_ROLLUP_1 BIGINT,     -- Hierarchy Category 1
    ROLE_ROLLUP_2 BIGINT,     -- Hierarchy Category 2
    ROLE_DEPTNAME BIGINT,     -- Department ID
    ROLE_TITLE BIGINT,        -- Job Title ID
    ROLE_FAMILY_DESC BIGINT,  -- Job Family Description ID
    ROLE_FAMILY BIGINT,       -- Job Family ID
    ROLE_CODE BIGINT          -- Unique Role Code
);
SELECT * FROM amazon_access_audit;
SELECT * FROM amazon_access_audit LIMIT 10;

SELECT 
    RESOURCE, 
    COUNT(*) as total_requests,
    SUM(CASE WHEN ACTION = 0 THEN 1 ELSE 0 END) as total_denials
FROM amazon_access_audit
GROUP BY RESOURCE
HAVING SUM(CASE WHEN ACTION = 0 THEN 1 ELSE 0 END) > 5
ORDER BY total_denials DESC;

SELECT 
    ROLE_DEPTNAME, 
    COUNT(*) as total_requests,
    ROUND(AVG(ACTION) * 100, 2) as success_percentage
FROM amazon_access_audit
GROUP BY ROLE_DEPTNAME
HAVING COUNT(*) > 100
ORDER BY success_percentage ASC
LIMIT 5;

SELECT 
    MGR_ID, 
    COUNT(*) as total_requests,
    SUM(CASE WHEN ACTION = 0 THEN 1 ELSE 0 END) as denials,
    ROUND((SUM(CASE WHEN ACTION = 0 THEN 1 ELSE 0 END)::DECIMAL / COUNT(*)) * 100, 2) as denial_rate
FROM amazon_access_audit
GROUP BY MGR_ID
HAVING COUNT(*) > 50
ORDER BY denial_rate DESC
LIMIT 5;

SELECT 
    ROLE_CODE, 
    COUNT(CASE WHEN ACTION = 1 THEN 1 END) as approved_count,
    COUNT(CASE WHEN ACTION = 0 THEN 1 END) as denied_count,
    COUNT(*) as total_requests
FROM amazon_access_audit
GROUP BY ROLE_CODE
HAVING COUNT(CASE WHEN ACTION = 0 THEN 1 END) > 10 
AND COUNT(CASE WHEN ACTION = 1 THEN 1 END) > 10
ORDER BY total_requests DESC;




