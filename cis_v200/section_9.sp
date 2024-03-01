locals {
  cis_v200_9_common_tags = merge(local.cis_v200_common_tags, {
    cis_section_id = "9"
  })
}

benchmark "cis_v200_9" {
  title         = "9 AppService"
  documentation = file("./cis_v200/docs/cis_v200_9.md")
  children = [
    // control.cis_v200_9_1,
    control.cis_v200_9_2,
    control.cis_v200_9_3,
    // control.cis_v200_9_4,
    control.cis_v200_9_5,
    control.cis_v200_9_6,
    control.cis_v200_9_7,
    control.cis_v200_9_8,
    control.cis_v200_9_9,
    control.cis_v200_9_10,
    control.cis_v200_9_11
  ]

  tags = merge(local.cis_v200_9_common_tags, {
    type    = "Benchmark"
    service = "Azure/AppService"
  })
}

control "cis_v200_9_1" {
  title         = "9.1 Ensure App Service Authentication is set up for apps in Azure App Service"
  description   = "Azure App Service Authentication is a feature that can prevent anonymous HTTP requests from reaching a Web Application or authenticate those with tokens before they reach the app. If an anonymous request is received from a browser, App Service will redirect to a logon page. To handle the logon process, a choice from a set of identity providers can be made, or a custom authentication mechanism can be implemented."
  query         = query.appservice_authentication_enabled
  documentation = file("./cis_v200/docs/cis_v200_9_1.md")

  tags = merge(local.cis_v200_9_common_tags, {
    cis_item_id = "9.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/AppService"
  })
}

control "cis_v200_9_2" {
  title         = "9.2 Ensure Web App Redirects All HTTP traffic to HTTPS in Azure App Service"
  description   = "Azure Web Apps allows sites to run under both HTTP and HTTPS by default. Web apps can be accessed by anyone using non-secure HTTP links by default. Non-secure HTTP requests can be restricted and all HTTP requests redirected to the secure HTTPS port. It is recommended to enforce HTTPS-only traffic."
  query         = query.appservice_web_app_use_https
  documentation = file("./cis_v200/docs/cis_v200_9_2.md")

  tags = merge(local.cis_v200_9_common_tags, {
    cis_item_id = "9.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/AppService"
  })
}

control "cis_v200_9_3" {
  title         = "9.3 Ensure Web App is using the latest version of TLS encryption"
  description   = "The TLS (Transport Layer Security) protocol secures transmission of data over the internet using standard encryption technology. Encryption should be set with the latest version of TLS. App service allows TLS 1.2 by default, which is the recommended TLS level by industry standards such as PCI DSS."
  query         = query.appservice_web_app_latest_tls_version
  documentation = file("./cis_v200/docs/cis_v200_9_3.md")

  tags = merge(local.cis_v200_9_common_tags, {
    cis_item_id = "9.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/AppService"
  })
}

control "cis_v200_9_4" {
  title         = "9.4 Ensure the web app has 'Client Certificates (Incoming client certificates)' set to 'On'"
  description   = "Client certificates allow for the app to request a certificate for incoming requests. Only clients that have a valid certificate will be able to reach the app."
  query         = query.appservice_web_app_incoming_client_cert_on
  documentation = file("./cis_v200/docs/cis_v200_9_4.md")

  tags = merge(local.cis_v200_9_common_tags, {
    cis_item_id = "9.4"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/AppService"
  })
}

control "cis_v200_9_5" {
  title         = "9.5 Ensure that Register with Azure Active Directory is enabled on App Service"
  description   = "Managed service identity in App Service provides more security by eliminating secrets from the app, such as credentials in the connection strings. When registering with Azure Active Directory in App Service, the app will connect to other Azure services securely without the need for usernames and passwords."
  query         = query.appservice_web_app_register_with_active_directory_enabled
  documentation = file("./cis_v200/docs/cis_v200_9_5.md")

  tags = merge(local.cis_v200_9_common_tags, {
    cis_item_id = "9.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/AppService"
  })
}

control "cis_v200_9_6" {
  title         = "9.6 Ensure That 'PHP version' is the Latest, If Used to Run the Web App"
  description   = "Periodically newer versions are released for PHP software either due to security flaws or to include additional functionality. Using the latest PHP version for web apps is recommended in order to take advantage of security fixes, if any, and/or additional functionalities of the newer version."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_9_6.md")

  tags = merge(local.cis_v200_9_common_tags, {
    cis_item_id = "9.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/AppService"
  })
}

control "cis_v200_9_7" {
  title         = "9.7 Ensure that 'Python version' is the Latest Stable Version, if Used to Run the Web App"
  description   = "Periodically, newer versions are released for Python software either due to security flaws or to include additional functionality. Using the latest full Python version for web apps is recommended in order to take advantage of security fixes, if any, and/or additional functionalities of the newer version."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_9_7.md")

  tags = merge(local.cis_v200_9_common_tags, {
    cis_item_id = "9.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/AppService"
  })
}

control "cis_v200_9_8" {
  title         = "9.8 Ensure that 'Java version' is the latest, if used to run the Web App"
  description   = "Periodically, newer versions are released for Java software either due to security flaws or to include additional functionality. Using the latest Java version for web apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the newer version."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_9_8.md")

  tags = merge(local.cis_v200_9_common_tags, {
    cis_item_id = "9.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/AppService"
  })
}

control "cis_v200_9_9" {
  title         = "9.9 Ensure that 'HTTP Version' is the Latest, if Used to Run the Web App"
  description   = "Periodically, newer versions are released for HTTP either due to security flaws or to include additional functionality. Using the latest HTTP version for web apps to take advantage of security fixes, if any, and/or new functionalities of the newer version."
  query         = query.appservice_web_app_latest_http_version
  documentation = file("./cis_v200/docs/cis_v200_9_9.md")

  tags = merge(local.cis_v200_9_common_tags, {
    cis_item_id = "9.9"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/AppService"
  })
}

control "cis_v200_9_10" {
  title         = "9.10 Ensure FTP deployments are Disabled"
  description   = "By default, Azure Functions, Web, and API Services can be deployed over FTP. If FTP is required for an essential deployment workflow, FTPS should be required for FTP login for all App Service Apps and Functions."
  query         = query.appservice_ftp_deployment_disabled
  documentation = file("./cis_v200/docs/cis_v200_9_10.md")

  tags = merge(local.cis_v200_9_common_tags, {
    cis_item_id = "9.10"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/AppService"
  })
}

control "cis_v200_9_11" {
  title         = "9.11 Ensure Azure Key Vaults are Used to Store Secrets"
  description   = "Azure Key Vault will store multiple types of sensitive information such as encryption keys, certificate thumbprints, and Managed Identity Credentials. Access to these 'Secrets' can be controlled through granular permissions."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_9_11.md")

  tags = merge(local.cis_v200_9_common_tags, {
    cis_item_id = "9.11"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/AppService"
  })
}
