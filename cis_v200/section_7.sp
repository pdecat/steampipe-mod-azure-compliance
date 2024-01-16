locals {
  cis_v200_7_common_tags = merge(local.cis_v200_common_tags, {
    cis_section_id = "7"
  })
}

benchmark "cis_v200_7" {
  title         = "7 Virtual Machines"
  documentation = file("./cis_v200/docs/cis_v200_7.md")
  children = [
    control.cis_v200_7_1,
    control.cis_v200_7_2,
    // control.cis_v200_7_3,
    // control.cis_v200_7_4,
    control.cis_v200_7_5,
    control.cis_v200_7_6,
    control.cis_v200_7_7
  ]

  tags = merge(local.cis_v200_7_common_tags, {
    type    = "Benchmark"
    service = "Azure/Compute"
  })
}

control "cis_v200_7_1" {
  title         = "7.1 Ensure an Azure Bastion Host Exists"
  description   = "The Azure Bastion service allows secure remote access to Azure Virtual Machines over the Internet without exposing remote access protocol ports and services directly to the Internet. The Azure Bastion service provides this access using TLS over 443/TCP, and subscribes to hardened configurations within an organization's Azure Active Directory service."
  query         = query.network_bastion_host_min_1
  documentation = file("./cis_v200/docs/cis_v200_7_1.md")

  tags = merge(local.cis_v200_7_common_tags, {
    cis_item_id = "7.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v200_7_2" {
  title         = "7.2 Ensure Virtual Machines are utilizing Managed Disks"
  description   = "Migrate blob-based VHDs to Managed Disks on Virtual Machines to exploit the default features of this configuration."
  query         = query.compute_vm_utilizing_managed_disk
  documentation = file("./cis_v200/docs/cis_v200_7_2.md")

  tags = merge(local.cis_v200_7_common_tags, {
    cis_item_id = "7.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v200_7_3" {
  title         = "7.3 Ensure that 'OS and Data' disks are encrypted with Customer Managed Key (CMK)"
  description   = "Ensure that OS disks (boot volumes) and data disks (non-boot volumes) are encrypted with CMK (Customer Managed Keys). Customer Managed keys can be either ADE or Server Side Encryption(SSE)."
  query         = query.compute_os_and_data_disk_encrypted_with_cmk
  documentation = file("./cis_v200/docs/cis_v200_7_3.md")

  tags = merge(local.cis_v200_7_common_tags, {
    cis_item_id = "7.3"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v200_7_4" {
  title         = "7.4 Ensure that 'Unattached disks' are encrypted with 'Customer Managed Key' (CMK)"
  description   = "Ensure that unattached disks in a subscription are encrypted with a Customer Managed Key (CMK)."
  query         = query.compute_unattached_disk_encrypted_with_cmk
  documentation = file("./cis_v200/docs/cis_v200_7_4.md")

  tags = merge(local.cis_v200_7_common_tags, {
    cis_item_id = "7.4"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v200_7_5" {
  title         = "7.5 Ensure that Only Approved Extensions Are Installed"
  description   = "For added security, only install organization-approved extensions on VMs."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_7_5.md")

  tags = merge(local.cis_v200_7_common_tags, {
    cis_item_id = "7.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Compute"
  })
}

control "cis_v200_7_6" {
  title         = "7.6 Ensure that Endpoint Protection for all Virtual Machines is installed"
  description   = "Install endpoint protection for all virtual machines."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_7_6.md")

  tags = merge(local.cis_v200_7_common_tags, {
    cis_item_id = "7.6"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Compute"
  })
}

control "cis_v200_7_7" {
  title         = "7.7 Ensure that VHDs are Encrypted"
  description   = "VHD (Virtual Hard Disks) are stored in blob storage and are the old-style disks that were attached to Virtual Machines. The blob VHD was then leased to the VM. By default, storage accounts are not encrypted, and Microsoft Defender will then recommend that the OS disks should be encrypted. Storage accounts can be encrypted as a whole using PMK or CMK. This should be turned on for storage accounts containing VHDs."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_7_7.md")

  tags = merge(local.cis_v200_7_common_tags, {
    cis_item_id = "7.7"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Compute"
  })
}
