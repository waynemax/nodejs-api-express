
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `node_main_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `apps_clients`
--

CREATE TABLE `apps_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `description` text NOT NULL,
  `os_type` int(1) NOT NULL COMMENT '0 - web client, 1 - ios, 2 - android, 3 - desktop, 4 - mini app',
  `secret_key` varchar(128) NOT NULL,
  `create_date` int(11) NOT NULL,
  `expires_time` int(11) NOT NULL COMMENT '0 - unlimited',
  `deactivated` smallint(1) NOT NULL,
  `role` smallint(1) NOT NULL COMMENT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `id` int(11) NOT NULL,
  `request_key` text NOT NULL,
  `response_value` text NOT NULL,
  `date_add` int(11) NOT NULL,
  `author_info` text NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `valid_until_time` int(11) NOT NULL,
  `access_token` text NOT NULL,
  `refresh_token` text NOT NULL,
  `ip` text NOT NULL,
  `ua` text NOT NULL,
  `owner_id` int(11) NOT NULL,
  `finger_hash` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `last_name` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `patronymic` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `login` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `phone` varchar(64) NOT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(256) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `hash` varchar(64) NOT NULL,
  `deactivated` smallint(1) NOT NULL,
  `last_seen` int(11) NOT NULL,
  `timezone` int(11) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `balance` float NOT NULL,
  `reg_date` int(11) NOT NULL,
  `full_name` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `photo` varchar(64) NOT NULL,
  `gender` int(1) NOT NULL,
  `is_closed` tinyint(1) NOT NULL,
  `secret_phrase` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vk_users`
--

CREATE TABLE `vk_users` (
  `id` int(11) NOT NULL,
  `vk_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `disabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apps_clients`
--
ALTER TABLE `apps_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `full_name` (`full_name`);

--
-- Indexes for table `vk_users`
--
ALTER TABLE `vk_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vk_id` (`vk_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apps_clients`
--
ALTER TABLE `apps_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `storage`
--
ALTER TABLE `storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vk_users`
--
ALTER TABLE `vk_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
