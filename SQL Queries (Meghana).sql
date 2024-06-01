USE project;

/* Query - 1 */
SELECT * FROM CaseDetails WHERE Status = 'Open';

/* Query - 2 */
SELECT Suspects.*, CaseDetails.CaseName
FROM Suspects
JOIN CaseDetails ON Suspects.CaseID = CaseDetails.CaseID
WHERE CaseDetails.CaseName = 'Zara Lone Disappearance';

/* Query - 3 */
SELECT * FROM Evidence WHERE LocationFound = 'Zara''s Apartment';

/* Query - 4 */
SELECT Witnesses.*, CaseDetails.CaseName
FROM Witnesses
JOIN CaseDetails ON Witnesses.CaseID = CaseDetails.CaseID
WHERE CaseDetails.CaseName = 'Zara Lone Disappearance';

/* Query - 5 */
SELECT ForensicAnalysis.*, Evidence.Description
FROM ForensicAnalysis
JOIN Evidence ON ForensicAnalysis.EvidenceID = Evidence.EvidenceID
JOIN CaseDetails ON ForensicAnalysis.CaseID = CaseDetails.CaseID
WHERE CaseDetails.CaseName = 'Zara Lone Disappearance';

/* Query - 6 */
SELECT * FROM PhoneRecords WHERE Caller = 'Rohan Mehra' OR Receiver = 'Rohan Mehra';
/* Query - 7 */
SELECT * FROM Documents WHERE CaseID = (SELECT CaseID FROM CaseDetails WHERE CaseName = 'Zara Lone Disappearance');

/* Query - 8 */
SELECT ForensicAnalysis.*, Evidence.Description, CaseDetails.CaseName
FROM ForensicAnalysis
JOIN Evidence ON ForensicAnalysis.EvidenceID = Evidence.EvidenceID
JOIN CaseDetails ON ForensicAnalysis.CaseID = CaseDetails.CaseID
WHERE Evidence.Type = 'DNA';

/* Extra credit */
DELIMITER //

CREATE PROCEDURE UpdateCaseStatus(IN evidenceCaseID INT)
BEGIN
    DECLARE caseStatus VARCHAR(50);
    
    -- Logic to determine case status based on evidence relevance
    SELECT Status INTO caseStatus
    FROM CaseDetails
    WHERE CaseID = evidenceCaseID;
    
    -- Update case status based on evidence relevance
    IF caseStatus = 'Open' THEN
        UPDATE CaseDetails SET Status = 'Under Investigation'
        WHERE CaseID = evidenceCaseID;
    END IF;
END //

DELIMITER ;







