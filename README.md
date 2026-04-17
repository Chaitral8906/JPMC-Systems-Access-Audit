# JPMC-Systems-Access-Audit
Simulated Access &amp; Entitlements Audit using the Amazon Employee Access Dataset to identify RBAC misalignments.
# Project: Global Banking Systems Access & Entitlement Audit

### Business Objective
To support operational excellence and audit readiness by analyzing system entitlement requests. This project identifies high-risk access trends and ensures Role-Based Access Control (RBAC) alignment.

### Dataset
* **Source:** Amazon Employee Access Dataset (32,000+ records)
* **Focus:** Actionable insights into approval/denial patterns for system resources.

### Key Audit Findings
1. **High-Risk Resource Identification:** Identified System ID 20897 as a high-friction point with a 40% denial rate, suggesting a need for Role Criteria review.
2. **Departmental Gap Analysis:** Found that Department 118992 had a significantly lower success rate (62.6%) compared to the firm average, indicating potential RBAC misconfiguration.
3. **Managerial Oversight:** Isolated specific managers (e.g., MGR_ID 54618) with nearly 50% denial rates, identifying a need for updated training on access provisioning policies.

### Technical Skills Demonstrated
* **SQL Logic:** Advanced aggregation (`GROUP BY`), conditional logic (`CASE WHEN`), and precision math (`DECIMAL` casting).
* **Risk Mitigation:** Identifying "Least Privilege" violations and Segregation of Duties (SoD) risks.

## Audit Methodology & Evidence

### 1. Resource Friction Analysis
*Pinpointing specific systems with high denial rates to investigate potential RBAC misalignments.*
![Resource Audit](resource_denial_audit.png)

### 2. Departmental Performance Metrics
*Tracking the success rate of access requests to identify business units needing role-criteria updates.*
![Department Audit](department_success_audit.png)

### 3. Managerial Oversight Trends
*Isolating managers with high team-denial rates for targeted policy training and support.*
![Manager Audit](manager_denial_rates.png)

### 4. Role Code Consistency Check
*Analyzing specific roles that exhibit both high approval and high denial rates to identify "Stale Access" risks.*
![Role Audit](role_code_inconsistency.png)
