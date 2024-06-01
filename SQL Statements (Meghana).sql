CREATE DATABASE Project;
CREATE TABLE CaseDetails (
    CaseID INT AUTO_INCREMENT PRIMARY KEY,
    CaseName VARCHAR(255),
    Description TEXT,
    DateOccurred DATE,
    Location VARCHAR(255),
    Status VARCHAR(50)
);

INSERT INTO CaseDetails (CaseName, Description, DateOccurred, Location, Status) 
VALUES 
('Zara Lone Disappearance', 'Investigation into the mysterious disappearance of Zara Lone.', '2023-11-27', 'Mumbai', 'Open'),
('Workplace Conflict', 'Investigation into a conflict at the workplace leading to an altercation.', '2023-12-01', 'Office Building', 'Open');

CREATE TABLE Suspects (
    SuspectID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    RelationshipToVictim VARCHAR(100),
    Alibi TEXT,
    Motive TEXT,
    ContactInformation VARCHAR(255),
    Status VARCHAR(50),
    CaseID INT,
    FOREIGN KEY (CaseID) REFERENCES CaseDetails(CaseID)
);

INSERT INTO Suspects (Name, RelationshipToVictim, Alibi, Motive, ContactInformation, Status, CaseID) 
VALUES 
('Rohan Mehra', 'Colleague', 'Was at a business meeting.', 'Professional rivalry', 'rohan@example.com, +91 9876543210', 'Under Investigation', 1),
('Amit Sharma', 'Ex-boyfriend', 'Claims to have been out of town.', 'Personal dispute', 'amit@example.com, +91 8765432109', 'Under Investigation', 1),
('Neha Kapoor', 'Friend', 'No alibi provided.', 'Unknown', 'neha@example.com, +91 7654321098', 'Under Investigation', 1),
('Ravi Shukla', 'Manager', 'Present at the workplace.', 'Workplace dispute', 'ravi@example.com, +91 6543210987', 'Under Investigation', 2),
('Priya Sharma', 'Co-worker', 'Present at the office.', 'Professional rivalry', 'priya@example.com, +91 5432109876', 'Under Investigation', 2);

CREATE TABLE Witnesses (
    WitnessID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Statement TEXT,
    ContactInformation VARCHAR(100),
    RelationshipToCase VARCHAR(100),
    ObservationDetails TEXT,
    CaseID INT,
    FOREIGN KEY (CaseID) REFERENCES CaseDetails(CaseID)
);

INSERT INTO Witnesses (Name, Statement, ContactInformation, RelationshipToCase, ObservationDetails, CaseID) 
VALUES 
('Sameer Gupta', 'Saw Neha arguing with Zara', '9876543200', 'Neighbor', 'N/A', 1),
('Sneha Singh', 'Saw Ravi near Zara''s apartment', '9876543201', 'Friend', 'Noticed Ravi acting suspiciously', 1),
('Rahul Verma', 'Saw Priya leaving the office late', '9876543202', 'Colleague', 'N/A', 2),
('Geeta Yadav', 'Saw Karan arguing with Zara', '9876543203', 'Neighbor', 'N/A', 2),
('Amit Kumar', 'Saw Aryan outside Zara''s apartment', '9876543204', 'Neighbor', 'N/A', 1);

CREATE TABLE Evidence (
    EvidenceID INT AUTO_INCREMENT PRIMARY KEY,
    Description TEXT,
    Type VARCHAR(50),
    DateFound DATE,
    LocationFound VARCHAR(255),
    RelevantCase VARCHAR(3),
    CaseID INT,
    FOREIGN KEY (CaseID) REFERENCES CaseDetails(CaseID)
);

INSERT INTO Evidence (Description, Type, DateFound, LocationFound, RelevantCase, CaseID) 
VALUES 
('Blood stains found at the crime scene.', 'DNA', '2023-11-28', 'Zara''s Apartment', 'Yes', 1),
('CCTV footage capturing a suspicious figure.', 'Footage', '2023-11-29', 'Office Lobby', 'Yes', 1),
('Fingerprint lifted from the crime scene.', 'Forensic', '2023-12-02', 'Zara''s Apartment', 'Yes', 1),
('Email exchange between the involved parties.', 'Document', '2023-12-03', 'Office Server', 'Yes', 2),
('Broken office equipment as physical evidence.', 'Physical', '2023-12-05', 'Office', 'Yes', 2);

CREATE TABLE Interviews (
    InterviewID INT AUTO_INCREMENT PRIMARY KEY,
    Interviewee VARCHAR(100),
    Interviewer VARCHAR(100),
    Transcript TEXT,
    DateConducted DATE,
    Location VARCHAR(255),
    CaseID INT,
    FOREIGN KEY (CaseID) REFERENCES CaseDetails(CaseID)
);

INSERT INTO Interviews (Interviewee, Interviewer, Transcript, DateConducted, Location, CaseID) 
VALUES 
('Neha Kapoor', 'Detective Kumar', 'Neha denied any involvement in the disappearance.', '2023-12-05', 'Police Station', 1),
('Ravi Shukla', 'Detective Singh', 'Ravi claimed to have no knowledge of Zara''s whereabouts.', '2023-12-07', 'Office Building', 1),
('Priya Sharma', 'Detective Patel', 'Priya provided an alibi for the time of the incident.', '2023-12-09', 'Police Station', 2);

CREATE TABLE Documents (
    DocumentID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255),
    Description TEXT,
    DateAdded DATE,
    CaseID INT,
    FOREIGN KEY (CaseID) REFERENCES CaseDetails(CaseID)
);

INSERT INTO Documents (Title, Description, DateAdded, CaseID) 
VALUES 
('Email Exchange', 'Correspondence related to the workplace conflict.', '2023-12-03', 2),
('Police Report', 'Official report filed regarding Zara''s disappearance.', '2023-12-05', 1);

CREATE TABLE PhoneRecords (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    Caller VARCHAR(100),
    Receiver VARCHAR(100),
    Duration TIME,
    DateRecorded DATE,
    CaseID INT,
    FOREIGN KEY (CaseID) REFERENCES CaseDetails(CaseID)
);

INSERT INTO PhoneRecords (Caller, Receiver, Duration, DateRecorded, CaseID) 
VALUES 
('Zara Lone', 'Amit Sharma', '00:10:34', '2023-11-27', 1),
('Rohan Mehra', 'Neha Kapoor', '00:08:21', '2023-12-01', 1),
('Ravi Shukla', 'Priya Sharma', '00:05:47', '2023-12-02', 2);

CREATE TABLE Surveillance (
    FootageID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(255),
    DateRecorded DATE,
    Description TEXT,
    CaseID INT,
    FOREIGN KEY (CaseID) REFERENCES CaseDetails(CaseID)
);

INSERT INTO Surveillance (Location, DateRecorded, Description, CaseID) 
VALUES 
('Office Lobby', '2023-11-29', 'Captured footage of a suspicious individual.', 1),
('Parking Lot', '2023-12-02', 'Surveillance footage showing an altercation.', 2);

CREATE TABLE ForensicAnalysis (
    AnalysisID INT AUTO_INCREMENT PRIMARY KEY,
    EvidenceID INT,
    Findings TEXT,
    Analyst VARCHAR(100),
    AnalysisDate DATE,
    CaseID INT,
    FOREIGN KEY (EvidenceID) REFERENCES Evidence(EvidenceID),
    FOREIGN KEY (CaseID) REFERENCES CaseDetails(CaseID)
);

INSERT INTO ForensicAnalysis (EvidenceID, Findings, Analyst, AnalysisDate, CaseID) 
VALUES 
(1, 'Blood type matches victim''s.', 'Dr. Gupta', '2023-11-28', 1),
(2, 'Identified the suspect from the footage.', 'Forensic Team', '2023-11-30', 1),
(3, 'Fingerprint matches suspect''s.', 'Dr. Khan', '2023-12-02', 1),
(4, 'Email sender identified.', 'Forensic Team', '2023-12-04', 2),
(5, 'Equipment damage matches suspect''s profile.', 'Dr. Patel', '2023-12-06', 2);

CREATE TABLE CaseTimeline (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    EventDescription TEXT,
    EventDate DATE,
    CaseID INT,
    FOREIGN KEY (CaseID) REFERENCES CaseDetails(CaseID)
);

INSERT INTO CaseTimeline (EventDescription, EventDate, CaseID) 
VALUES 
('Zara Lone reported missing.', '2023-11-27', 1),
('Initial investigation launched for Zara Lone''s disappearance.', '2023-11-28', 1),
('Forensic evidence collected from the scene of Zara Lone''s disappearance.', '2023-11-29', 1),
('Witness interviews conducted for Zara Lone''s disappearance.', '2023-12-01', 1),
('Additional evidence discovered linking to potential suspects for Zara Lone''s disappearance.', '2023-12-03', 1),
('Media coverage of Zara Lone''s disappearance intensifies.', '2023-12-05', 1),
('Surveillance footage analyzed for clues in Zara Lone''s disappearance.', '2023-12-07', 1),
('Task force formed to coordinate investigation efforts for Zara Lone''s disappearance.', '2023-12-09', 1),
('Case reassigned to a new team of investigators for Zara Lone''s disappearance.', '2023-12-11', 1),
('Breakthrough in the case leads to suspect identification for Zara Lone''s disappearance.', '2023-12-15', 1),
('Conflict reported at the workplace.', '2023-12-01', 2),
('Initial investigation launched for the workplace conflict.', '2023-12-02', 2),
('Witness interviews conducted for the workplace conflict.', '2023-12-03', 2),
('Forensic evidence collected from the scene of the workplace conflict.', '2023-12-05', 2),
('Suspect identified based on evidence for the workplace conflict.', '2023-12-07', 2),
('Legal proceedings initiated against the suspect for the workplace conflict.', '2023-12-10', 2);
