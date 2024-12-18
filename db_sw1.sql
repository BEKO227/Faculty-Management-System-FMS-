-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2023 at 10:49 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sw1`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `AnswerID` int(11) NOT NULL,
  `QuestionID` int(11) DEFAULT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `FileURL` varchar(255) DEFAULT NULL,
  `Grade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `CourseID` int(11) NOT NULL,
  `SubjectID` int(11) DEFAULT NULL,
  `ProfessorID` int(11) DEFAULT NULL,
  `Room` varchar(50) DEFAULT NULL,
  `ScheduleDay` varchar(20) DEFAULT NULL,
  `ScheduleTime` time DEFAULT NULL,
  `DurationHours` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `EnrollmentID` int(11) NOT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `StudentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `LevelID` int(11) NOT NULL,
  `LevelName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`LevelID`, `LevelName`) VALUES
(1, 'lv1');

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `ProfessorID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Degree` varchar(50) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `NationalID` varchar(20) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`ProfessorID`, `Name`, `Degree`, `Gender`, `NationalID`, `DateOfBirth`, `Department`, `Username`, `Password`, `Email`) VALUES
(1200, 'John Smith', 'Ph.D. in Computer Science', 'Male', 'US123456', '1975-05-15', 'Computer Science', 'john_smith_cs', 'password123', 'john.smith@example.com'),
(1201, 'Mary Johnson', 'Ph.D. in Computer Science', 'Female', 'US789012', '1980-09-22', 'Computer Science', 'mary_johnson_cs', 'pass456', 'mary.johnson@example.com'),
(1202, 'David Wang', 'Ph.D. in Computer Engineering', 'Male', 'US345678', '1978-11-30', 'Computer Science', 'david_wang_cs', 'secure789', 'david.wang@example.com'),
(1203, 'Emily Chen', 'Ph.D. in Information Systems', 'Female', 'US901234', '1985-03-10', 'Computer Science', 'emily_chen_cs', 'pass321', 'emily.chen@example.com'),
(1204, 'Michael Liu', 'Ph.D. in Artificial Intelligence', 'Male', 'US567890', '1982-07-05', 'Computer Science', 'michael_liu_cs', 'pwd123', 'michael.liu@example.com'),
(1205, 'Jennifer Brown', 'Ph.D. in Mathematics', 'Female', 'US345678', '1977-04-12', 'Mathematics', 'jennifer_brown_math', 'math456', 'jennifer.brown@example.com'),
(1206, 'Daniel Kim', 'Ph.D. in Statistics', 'Male', 'US901234', '1984-08-25', 'Mathematics', 'daniel_kim_math', 'stat789', 'daniel.kim@example.com'),
(1207, 'Sophia Patel', 'Ph.D. in Applied Mathematics', 'Female', 'US567890', '1981-12-03', 'Mathematics', 'sophia_patel_math', 'math123', 'sophia.patel@example.com'),
(1208, 'Matthew Lee', 'Ph.D. in Mathematical Modeling', 'Male', 'US123456', '1979-06-18', 'Mathematics', 'matthew_lee_math', 'model456', 'matthew.lee@example.com'),
(1210, 'Brian Miller', 'Ph.D. in Physics', 'Male', 'US567890', '1976-09-08', 'Physics', 'brian_miller_phy', 'phy123', 'brian.miller@example.com'),
(1211, 'Olivia Davis', 'Ph.D. in Astrophysics', 'Female', 'US123456', '1983-01-20', 'Physics', 'olivia_davis_phy', 'astro456', 'olivia.davis@example.com'),
(1212, 'William Chen', 'Ph.D. in Quantum Mechanics', 'Male', 'US789012', '1988-05-06', 'Physics', 'william_chen_phy', 'quantum789', 'william.chen@example.com'),
(1213, 'Sophie Wang', 'Ph.D. in Nuclear Physics', 'Female', 'US901234', '1980-07-15', 'Physics', 'sophie_wang_phy', 'nuclear123', 'sophie.wang@example.com'),
(1214, 'Caleb Johnson', 'Ph.D. in Particle Physics', 'Male', 'US345678', '1978-03-30', 'Physics', 'caleb_johnson_phy', 'particle456', 'caleb.johnson@example.com');

--
-- Triggers `professors`
--
DELIMITER $$
CREATE TRIGGER `InsertUserAfterProfessor` AFTER INSERT ON `professors` FOR EACH ROW BEGIN
    INSERT INTO `user` (id, name, username, password, type, email)
    VALUES (NEW.ProfessorID, NEW.Name, NEW.Username, NEW.Password, 'professor', NEW.Email);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_user_after_professor_update` AFTER UPDATE ON `professors` FOR EACH ROW BEGIN
    UPDATE user
    SET
        Name = NEW.Name,
        Username = NEW.Username,
        Password = NEW.Password
    WHERE id = NEW.ProfessorID AND type = 'professor';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `QuestionID` int(11) NOT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `TextQuestion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(50) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `LevelID` int(11) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `Name`, `Age`, `Email`, `Password`, `Phone`, `LevelID`, `Username`, `Address`, `Photo`) VALUES
(700, 'Emma Johnson', 20, 'emma.johnson@example.com', 'password123', '123-456-7890', 1, 'emma_student', '123 Main St, Cityville', 'photo_emma.jpg'),
(701, 'Ryan Smith', 21, 'ryan.smith@example.com', 'pass456', '987-654-3210', 1, 'ryan_student', '456 Oak St, Townsville', 'photo_ryan.jpg'),
(702, 'Sophia Wang', 19, 'sophia.wang@example.com', 'secure789', '111-222-3333', 1, 'sophia_student', '789 Pine St, Villageland', 'photo_sophia.jpg'),
(703, 'Ethan Chen', 22, 'ethan.chen@example.com', 'pass321', '444-555-6666', 1, 'ethan_student', '567 Cedar St, Hamletville', 'photo_ethan.jpg');

--
-- Triggers `students`
--
DELIMITER $$
CREATE TRIGGER `InsertUserAfterStudent` AFTER INSERT ON `students` FOR EACH ROW BEGIN
    INSERT INTO `user` (id, name, username, password, type, email)
    VALUES (NEW.StudentID, NEW.Name, NEW.Username, NEW.Password, 'student', NEW.Email);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_user_after_student_update` AFTER UPDATE ON `students` FOR EACH ROW BEGIN
    UPDATE `user`
    SET
        `name` = NEW.Name,
        `email` = NEW.Email,
        `age` = NEW.Age,
        `phone` = NEW.Phone,
        `address` = NEW.Address,
        `username` = NEW.Username,
        `password` = NEW.Password
    WHERE `id` = NEW.StudentID AND `type` = 'student';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `SubjectID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Code` varchar(20) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `LevelID` int(11) DEFAULT NULL,
  `Semester` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`SubjectID`, `Name`, `Code`, `Description`, `LevelID`, `Semester`) VALUES
(1, 'Introduction to Economics', 'ECO101', 'Basic principles of economics.', 1, 1),
(2, 'World History', 'HIS201', 'Overview of world history and major events.', 1, 2),
(3, 'Environmental Science', 'ENV301', 'Study of environmental issues and conservation.', 1, 3),
(4, 'Digital Marketing', 'BUS401', 'Principles and strategies of digital marketing.', 1, 4),
(5, 'Graphic Design', 'ART501', 'Introduction to graphic design principles.', 1, 5),
(6, 'AI Governance', 'AI1001', 'Policies and governance related to artificial intelligence.', 1, 10),
(7, 'Web Development', 'CS701', 'Design and implementation of web-based applications.', 1, 7),
(8, 'Cybersecurity', 'CS801', 'Fundamentals of cybersecurity and information assurance.', 1, 8),
(9, 'Distributed Systems', 'CS901', 'Study of distributed computing and system architectures.', 1, 9),
(10, 'Cloud Computing', 'CS1001', 'Principles and practices of cloud computing technologies.', 1, 10),
(11, 'Reinforcement Learning', 'AI601', 'Study of reinforcement learning algorithms and applications.', 1, 6),
(12, 'Robotics', 'AI701', 'Fundamentals of robotics and autonomous systems.', 1, 7),
(13, 'Ethics in AI', 'AI801', 'Ethical considerations in the development and use of AI technologies.', 1, 8),
(14, 'AI for Healthcare', 'AI901', 'Applications of AI in the healthcare domain.', 1, 9),
(29, 'Software Engineering', 'CS601', 'Principles of software engineering and development.', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `type`, `email`, `address`, `age`, `phone`, `Photo`) VALUES
(1, 'Mohamed Basiouny', 'basiouny', '123', 'admin', 'mohamed@gmail.com', 'October', 21, '01117035216', NULL),
(700, 'Emma Johnson', 'emma_student', 'password123', 'student', 'emma.johnson@example.com', NULL, NULL, NULL, NULL),
(701, 'Ryan Smith', 'ryan_student', 'pass456', 'student', 'ryan.smith@example.com', NULL, NULL, NULL, NULL),
(702, 'Sophia Wang', 'sophia_student', 'secure789', 'student', 'sophia.wang@example.com', NULL, NULL, NULL, NULL),
(703, 'Ethan Chen', 'ethan_student', 'pass321', 'student', 'ethan.chen@example.com', NULL, NULL, NULL, NULL),
(1200, 'John Smith', 'john_smith_cs', 'password123', 'professor', 'john.smith@example.com', NULL, NULL, NULL, NULL),
(1201, 'Mary Johnson', 'mary_johnson_cs', 'pass456', 'professor', 'mary.johnson@example.com', NULL, NULL, NULL, NULL),
(1202, 'David Wang', 'david_wang_cs', 'secure789', 'professor', 'david.wang@example.com', NULL, NULL, NULL, NULL),
(1203, 'Emily Chen', 'emily_chen_cs', 'pass321', 'professor', 'emily.chen@example.com', NULL, NULL, NULL, NULL),
(1204, 'Michael Liu', 'michael_liu_cs', 'pwd123', 'professor', 'michael.liu@example.com', NULL, NULL, NULL, NULL),
(1205, 'Jennifer Brown', 'jennifer_brown_math', 'math456', 'professor', 'jennifer.brown@example.com', NULL, NULL, NULL, NULL),
(1206, 'Daniel Kim', 'daniel_kim_math', 'stat789', 'professor', 'daniel.kim@example.com', NULL, NULL, NULL, NULL),
(1207, 'Sophia Patel', 'sophia_patel_math', 'math123', 'professor', 'sophia.patel@example.com', NULL, NULL, NULL, NULL),
(1208, 'Matthew Lee', 'matthew_lee_math', 'model456', 'professor', 'matthew.lee@example.com', NULL, NULL, NULL, NULL),
(1210, 'Brian Miller', 'brian_miller_phy', 'phy123', 'professor', 'brian.miller@example.com', NULL, NULL, NULL, NULL),
(1211, 'Olivia Davis', 'olivia_davis_phy', 'astro456', 'professor', 'olivia.davis@example.com', NULL, NULL, NULL, NULL),
(1212, 'William Chen', 'william_chen_phy', 'quantum789', 'professor', 'william.chen@example.com', NULL, NULL, NULL, NULL),
(1213, 'Sophie Wang', 'sophie_wang_phy', 'nuclear123', 'professor', 'sophie.wang@example.com', NULL, NULL, NULL, NULL),
(1214, 'Caleb Johnson', 'caleb_johnson_phy', 'particle456', 'professor', 'caleb.johnson@example.com', NULL, NULL, NULL, NULL);

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `DeleteProfessorAfterUser` AFTER DELETE ON `user` FOR EACH ROW BEGIN
    DELETE FROM `professors` WHERE `ProfessorID` = OLD.id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DeleteStudentAfterUser` AFTER DELETE ON `user` FOR EACH ROW BEGIN
    DELETE FROM `students` WHERE `StudentID` = OLD.id;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD KEY `answers_ibfk_2` (`StudentID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `SubjectID` (`SubjectID`),
  ADD KEY `ProfessorID` (`ProfessorID`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD UNIQUE KEY `unique_enrollment` (`CourseID`,`StudentID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`LevelName`) USING BTREE,
  ADD KEY `LevelID` (`LevelID`) USING BTREE;

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`ProfessorID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`QuestionID`),
  ADD KEY `questions_ibfk_1` (`CourseID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `LevelID` (`LevelID`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`SubjectID`),
  ADD UNIQUE KEY `Code` (`Code`),
  ADD KEY `LevelID` (`LevelID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UniqueUsername` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `CourseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
  MODIFY `ProfessorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1215;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `QuestionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10026;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `SubjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10025;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`SubjectID`) REFERENCES `subjects` (`SubjectID`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`ProfessorID`) REFERENCES `professors` (`ProfessorID`) ON DELETE CASCADE;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`LevelID`) REFERENCES `levels` (`LevelID`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`LevelID`) REFERENCES `levels` (`LevelID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
