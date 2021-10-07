locals {
  regulatory_compliance_mysql_common_tags = {
    service = "mysql"
  }
}

control "mysql_ssl_enabled" {
  title       = "Enforce SSL connection should be enabled for MySQL database servers"
  description = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql         = query.mysql_ssl_enabled.sql

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mysql_db_server_geo_redundant_backup_enabled" {
  title       = "Geo-redundant backup should be enabled for Azure Database for MySQL"
  description = "Azure Database for MySQL allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
  sql         = query.mysql_db_server_geo_redundant_backup_enabled.sql

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mssql_managed_instance_encryption_at_rest_using_cmk" {
  title       = "SQL managed instances should use customer-managed keys to encrypt data at rest"
  description = "Implementing Transparent Data Encryption (TDE) with your own key provides you with increased transparency and control over the TDE Protector, increased security with an HSM-backed external service, and promotion of separation of duties. This recommendation applies to organizations with a related compliance requirement."
  sql         = query.mssql_managed_instance_encryption_at_rest_using_cmk.sql

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    hipaa_hitrust_v92    = "true"
  })
}

control "mssql_managed_instance_vulnerability_assessment_enabled" {
  title       = "Vulnerability assessment should be enabled on SQL Managed Instance"
  description = "Audit each SQL Managed Instance which doesn't have recurring vulnerability assessment scans enabled. Vulnerability assessment can discover, track, and help you remediate potential database vulnerabilities."
  sql         = query.mssql_managed_instance_vulnerability_assessment_enabled.sql

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mysql_server_public_network_access_disabled" {
  title       = "Public network access should be disabled for MySQL servers"
  description = "Disable the public network access property to improve security and ensure your Azure Database for MySQL can only be accessed from a private endpoint. This configuration strictly disables access from any public address space outside of Azure IP range, and denies all logins that match IP or virtual network-based firewall rules."
  sql         = query.mysql_server_public_network_access_disabled.sql

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mysql_server_infrastructure_encryption_enabled" {
  title       = "Infrastructure encryption should be enabled for Azure Database for MySQL servers"
  description = "Enable infrastructure encryption for Azure Database for MySQL servers to have higher level of assurance that the data is secure. When infrastructure encryption is enabled, the data at rest is encrypted twice using FIPS 140-2 compliant Microsoft managed keys."
  sql         = query.mysql_server_infrastructure_encryption_enabled.sql

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mysql_server_private_link_used" {
  title       = "Private endpoint should be enabled for MySQL servers"
  description = "Private endpoint connections enforce secure communication by enabling private connectivity to Azure Database for MySQL. Configure a private endpoint connection to enable access to traffic coming only from known networks and prevent access from all other IP addresses, including within Azure."
  sql         = query.mysql_server_private_link_used.sql

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mysql_server_encrypted_at_rest_using_cmk" {
  title       = "MySQL servers should use customer-managed keys to encrypt data at rest"
  description = "Use customer-managed keys to manage the encryption at rest of your MySQL servers. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  sql         = query.mysql_server_encrypted_at_rest_using_cmk.sql

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
