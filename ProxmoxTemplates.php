<?php

/**
 * Proxmox module for FOSSBilling
 *
 * @author   FOSSBilling (https://www.fossbilling.org) & Anuril (https://github.com/anuril) 
 * @license  GNU General Public License version 3 (GPLv3)
 *
 * This software may contain code previously used in the BoxBilling project.
 * Copyright BoxBilling, Inc 2011-2021
 * Original Author: Scitch (https://github.com/scitch)
 *
 * This source file is subject to the GNU General Public License version 3 (GPLv3) that is bundled
 * with this source code in the file LICENSE. 
 * This Module has been written originally by Scitch (https://github.com/scitch) and has been forked from the original BoxBilling Module.
 * It has been rewritten extensively.
 */

namespace Box\Mod\Serviceproxmox;

/**
 * Proxmox module for FOSSBilling
 */
trait ProxmoxTemplates
{
	/* ################################################################################################### */
	/* ####################################  VM Template Mgmt  ########################################### */
	/* ################################################################################################### */
	
	// Function that gets all the VM templates and returns them as an array
	public function get_vmtemplates()
	{
		// get all the VM templates from the service_proxmox_vm_config_template table
		$templates = $this->di['db']->findAll('service_proxmox_vm_config_template');
		return $templates;
	}


	// Function that gets all the LXC templates and returns them as an array
	public function get_lxctemplates()
	{
		// get all the LXC templates from the service_proxmox_lxc_config_template table
		$templates = $this->di['db']->findAll('service_proxmox_lxc_config_template');
		return $templates;
	}
}