-- Migration: 0.0.5
-- Initial Migration for Proxmox Server Module


-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_proxmox_server` (
            `id` bigint(20) NOT NULL AUTO_INCREMENT,
            `name` varchar(255) DEFAULT NULL,
            `group` varchar(255) DEFAULT NULL,
            `ipv4` varchar(255) DEFAULT NULL,
            `ipv6` varchar(255) DEFAULT NULL,
            `hostname` varchar(255) DEFAULT NULL,
			`port` varchar(255) DEFAULT NULL,
			`realm` varchar(255) DEFAULT NULL,
			`cpu_cores` bigint(20) DEFAULT NULL,
			`cpu_cores_allocated` bigint(20) DEFAULT NULL,
			`ram` bigint(20) DEFAULT NULL,
			`ram_allocated` bigint(20) DEFAULT NULL,
			`root_user` varchar(255) DEFAULT NULL,
            `root_password` varchar(255) DEFAULT NULL,
			`tokenname` varchar(255) DEFAULT NULL,
			`tokenvalue` varchar(255) DEFAULT NULL,			
            `config` text,
			`active` bigint(20) DEFAULT NULL,
            `created_at` varchar(35) DEFAULT NULL,
            `updated_at` varchar(35) DEFAULT NULL,
            PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_proxmox` (
            `id` bigint(20) NOT NULL AUTO_INCREMENT,
			`client_id` bigint(20) DEFAULT NULL,
			`order_id` bigint(20) DEFAULT NULL,
			`server_id` bigint(20) DEFAULT NULL,
			`template_vmid` bigint(20) DEFAULT NULL,
			`vm_config_template_id` bigint(20) DEFAULT NULL,
			`vmid` bigint(20) DEFAULT NULL,
			`ipv4` varchar(255) DEFAULT NULL,
            `ipv6` varchar(255) DEFAULT NULL,
			`hostname` varchar(255) DEFAULT NULL,
			`password` varchar(255) DEFAULT NULL,
            `config` text,
			`status` varchar(255) DEFAULT NULL,	
			`storage` varchar(255) DEFAULT NULL,
			`cpu_cores` varchar(255) DEFAULT NULL,
            `created_at` varchar(35) DEFAULT NULL,
            `updated_at` varchar(35) DEFAULT NULL,
            PRIMARY KEY (`id`),
			KEY `client_id_idx` (`client_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_proxmox_users` (
            `id` bigint(20) NOT NULL AUTO_INCREMENT,
			`client_id` bigint(20) DEFAULT NULL,
			`server_id` bigint(20) DEFAULT NULL,
			`admin_tokenname` varchar(255) DEFAULT NULL,
			`admin_tokenvalue` varchar(255) DEFAULT NULL,
			`view_tokenname` varchar(255) DEFAULT NULL,
			`view_tokenvalue` varchar(255) DEFAULT NULL,
            `created_at` varchar(35) DEFAULT NULL,
            `updated_at` varchar(35) DEFAULT NULL,
            PRIMARY KEY (`id`),
			KEY `client_id_idx` (`client_id`),
			KEY `server_id_idx` (`server_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_proxmox_storageclass` (
			`id` bigint(20) NOT NULL AUTO_INCREMENT,
			`storageclass` varchar(35) DEFAULT NULL,
			PRIMARY KEY (`id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_proxmox_storage` (
			`id` bigint(20) NOT NULL AUTO_INCREMENT,
			`server_id` bigint(20) DEFAULT NULL,
			`storage` varchar(255) DEFAULT NULL,
			`type` varchar(255) DEFAULT NULL,
			`content` varchar(255) DEFAULT NULL,
			`active` bigint(20) DEFAULT NULL,
			`storageclass` varchar(35) DEFAULT NULL,
			`size` bigint(20) DEFAULT NULL,
			`used` bigint(20) DEFAULT NULL,
			`free` bigint(20) DEFAULT NULL,
			PRIMARY KEY (`id`),
			UNIQUE KEY `server_storage_unique` (`server_id`, `storage`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;            


-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_proxmox_lxc_appliance` (
			`id` bigint(20) NOT NULL AUTO_INCREMENT,
			`source` varchar(255) DEFAULT NULL,
			`type` varchar(255) DEFAULT NULL,
			`package` varchar(255) DEFAULT NULL,
			`section` varchar(255) DEFAULT NULL,

			`location` varchar(255) DEFAULT NULL,
			`headline` varchar(255) DEFAULT NULL,
			`os` varchar(255) DEFAULT NULL,
			`template` varchar(255) DEFAULT NULL,
			`description` varchar(255) DEFAULT NULL,
			`architecture` varchar(255) DEFAULT NULL,
			`md5sum` varchar(255) DEFAULT NULL,
			`sha512sum` varchar(255) DEFAULT NULL,
			`version` varchar(255) DEFAULT NULL,
			`infopage` varchar(255) DEFAULT NULL,
			PRIMARY KEY (`id`),
			UNIQUE KEY `sha512sum_idx` (`sha512sum`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `service_proxmox_vm_config_template` (
            `id` bigint(20) NOT NULL AUTO_INCREMENT,
            `name` varchar(255) DEFAULT NULL,
            `description` varchar(255) DEFAULT NULL,
            `cores` bigint(20) DEFAULT NULL,
            `memory` bigint(20) DEFAULT NULL,
            `balloon` TINYINT(1) DEFAULT 0,
            `balloon_size` bigint(20) DEFAULT NULL,
            `os` varchar(255) DEFAULT NULL,
            `bios` varchar(255) DEFAULT NULL,
            `onboot` TINYINT(1) DEFAULT 1,
            `agent` TINYINT(1) DEFAULT 1,
            `created_at` varchar(35) DEFAULT NULL,
            `updated_at` varchar(35) DEFAULT NULL,
            PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- --------------------------------------------------------
-- Create vm storage template table
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_proxmox_vm_storage_template` (
            `id` bigint(20) NOT NULL AUTO_INCREMENT,
            `template_id` bigint(20) DEFAULT NULL,
            `storage_type` varchar(255) DEFAULT NULL,
            `size` bigint(20) DEFAULT NULL,
            `format` varchar(255) DEFAULT NULL,
            `created_at` varchar(35) DEFAULT NULL,
            `updated_at` varchar(35) DEFAULT NULL,
            PRIMARY KEY (`id`),
            KEY `template_id_idx` (`template_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


-- --------------------------------------------------------
-- Create vm network template table
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_proxmox_vm_network_template` (
            `id` bigint(20) NOT NULL AUTO_INCREMENT,
            `template_id` bigint(20) DEFAULT NULL,
            `network_type` varchar(255) DEFAULT NULL,
            `model` varchar(255) DEFAULT NULL,
            `macaddr` varchar(255) DEFAULT NULL,
            `bridge` varchar(255) DEFAULT NULL,
            `tag` bigint(20) DEFAULT NULL,
            `firewall` TINYINT(1) DEFAULT 0,
            `queues` bigint(20) DEFAULT NULL,
            `created_at` varchar(35) DEFAULT NULL,
            `updated_at` varchar(35) DEFAULT NULL,
            PRIMARY KEY (`id`),
            KEY `template_id_idx` (`template_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

			CREATE TABLE IF NOT EXISTS `service_proxmox_lxc_config_template` (
            `id` bigint(20) NOT NULL AUTO_INCREMENT,
            `template_id` bigint(20) DEFAULT NULL,
            `name` varchar(255) DEFAULT NULL,
            `cores` bigint(20) DEFAULT NULL,
            `description` varchar(255) DEFAULT NULL,
            `memory` bigint(20) DEFAULT NULL,
            `swap` bigint(20) DEFAULT NULL,
            `ostemplate` varchar(255) DEFAULT NULL,
            `onboot` TINYINT(1) DEFAULT 1,
            `created_at` varchar(35) DEFAULT NULL,
            `updated_at` varchar(35) DEFAULT NULL,
            PRIMARY KEY (`id`),
            KEY `template_id_idx` (`template_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- --------------------------------------------------------
--  add lxc storage template table with a foreign key to service_proxmox_lxc_template
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_proxmox_lxc_storage_template` (
            `id` bigint(20) NOT NULL AUTO_INCREMENT,
            `template_id` bigint(20) DEFAULT NULL,
            `storage_type` varchar(255) DEFAULT NULL,
            `size` bigint(20) DEFAULT NULL,
            `format` varchar(255) DEFAULT NULL,
            `created_at` varchar(35) DEFAULT NULL,
            `updated_at` varchar(35) DEFAULT NULL,
            PRIMARY KEY (`id`),
            KEY `template_id_idx` (`template_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- --------------------------------------------------------
--  add lxc network template table with a foreign key to service_proxmox_lxc_template
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_proxmox_lxc_network_template` (
            `id` bigint(20) NOT NULL AUTO_INCREMENT,
            `template_id` bigint(20) DEFAULT NULL,
            `network_type` varchar(255) DEFAULT NULL,
            `model` varchar(255) DEFAULT NULL,
            `macaddr` varchar(255) DEFAULT NULL,
            `bridge` varchar(255) DEFAULT NULL,
            `tag` bigint(20) DEFAULT NULL,
            `firewall` TINYINT(1) DEFAULT 0,
            `queues` bigint(20) DEFAULT NULL,
            `created_at` varchar(35) DEFAULT NULL,
            `updated_at` varchar(35) DEFAULT NULL,
            PRIMARY KEY (`id`),
            KEY `template_id_idx` (`template_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
-- --------------------------------------------------------

--- New Table: service_proxmox_client_vlan
-- --------------------------------------------------------
-- Table to store client vlans
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_proxmox_client_vlan` (
            `id` bigint(20) NOT NULL AUTO_INCREMENT,
            `client_id` bigint(20) DEFAULT NULL,
            `vlan` bigint(20) DEFAULT NULL,
            `ip_range` varchar(255) DEFAULT NULL,
            `created_at` varchar(35) DEFAULT NULL,
            `updated_at` varchar(35) DEFAULT NULL,
            PRIMARY KEY (`id`),
            KEY `client_id_idx` (`client_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- --------------------------------------------------------

--- New Table: service_proxmox_ip_range
-- --------------------------------------------------------
-- Table to store ip networks
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_proxmox_ip_range` (
            `id` bigint(20) NOT NULL AUTO_INCREMENT,
            `cidr` varchar(255) DEFAULT NULL,
            `gateway` varchar(255) DEFAULT NULL,
            `broadcast` varchar(255) DEFAULT NULL,
            `type` varchar(255) DEFAULT NULL,
            `created_at` varchar(35) DEFAULT NULL,
            `updated_at` varchar(35) DEFAULT NULL,
            PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;



-- add template vm table for storing information about qemu_template VMs
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_proxmox_qemu_template` (
            `id` bigint(20) NOT NULL,
            `server_id` bigint(20) DEFAULT NULL,
            `name` varchar(255) DEFAULT NULL,
            `created_at` varchar(35) DEFAULT NULL,
            `updated_at` varchar(35) DEFAULT NULL,
            PRIMARY KEY (`id`),
            KEY `id_idx` (`id`),
            UNIQUE KEY `vmid_server_id_idx` (`id`, `server_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
-- --------------------------------------------------------
COMMIT;
