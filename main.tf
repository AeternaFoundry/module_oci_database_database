resource "oci_database_database" "database_databases" {
  for_each = var.database_databases

  source             = each.value.source
  action_trigger     = each.value.action_trigger
  data_guard_action  = each.value.data_guard_action
  db_home_id         = each.value.db_home_id
  db_version         = each.value.db_version
  key_store_id       = each.value.key_store_id
  kms_key_id         = each.value.kms_key_id
  kms_key_migration  = each.value.kms_key_migration
  kms_key_rotation   = each.value.kms_key_rotation
  kms_key_version_id = each.value.kms_key_version_id
  vault_id           = each.value.vault_id
  vm_cluster_id      = each.value.vm_cluster_id

  database {
    admin_password = each.value.database.admin_password
    dynamic "auto_failover_configuration" {
      for_each = each.value.database.auto_failover_configuration != null ? [each.value.database.auto_failover_configuration] : []
      content {
        failover_targets      = auto_failover_configuration.value.failover_targets
        managed_auto_failover = auto_failover_configuration.value.managed_auto_failover
      }
    }
    backup_id                  = each.value.database.backup_id
    backup_tde_password        = each.value.database.backup_tde_password
    character_set              = each.value.database.character_set
    database_admin_password    = each.value.database.database_admin_password
    database_id                = each.value.database.database_id
    database_software_image_id = each.value.database.database_software_image_id
    dynamic "db_backup_config" {
      for_each = each.value.database.db_backup_config != null ? [each.value.database.db_backup_config] : []
      content {
        auto_backup_enabled     = db_backup_config.value.auto_backup_enabled
        auto_backup_window      = db_backup_config.value.auto_backup_window
        auto_full_backup_day    = db_backup_config.value.auto_full_backup_day
        auto_full_backup_window = db_backup_config.value.auto_full_backup_window
        backup_deletion_policy  = db_backup_config.value.backup_deletion_policy
        dynamic "backup_destination_details" {
          for_each = db_backup_config.value.backup_destination_details != null ? db_backup_config.value.backup_destination_details : []
          content {
            backup_retention_policy_on_terminate = backup_destination_details.value.backup_retention_policy_on_terminate
            dbrs_policy_id                       = backup_destination_details.value.dbrs_policy_id
            id                                   = backup_destination_details.value.id
            is_remote                            = backup_destination_details.value.is_remote
            is_retention_lock_enabled            = backup_destination_details.value.is_retention_lock_enabled
            is_zero_data_loss_enabled            = backup_destination_details.value.is_zero_data_loss_enabled
            remote_region                        = backup_destination_details.value.remote_region
            dynamic "tde_wallet_backup_destination" {
              for_each = backup_destination_details.value.tde_wallet_backup_destination != null ? [backup_destination_details.value.tde_wallet_backup_destination] : []
              content {
                backup_destination_id   = tde_wallet_backup_destination.value.backup_destination_id
                backup_destination_type = tde_wallet_backup_destination.value.backup_destination_type
              }
            }
            type         = backup_destination_details.value.type
            vpc_password = backup_destination_details.value.vpc_password
            vpc_user     = backup_destination_details.value.vpc_user
          }
        }
        recovery_window_in_days   = db_backup_config.value.recovery_window_in_days
        run_immediate_full_backup = db_backup_config.value.run_immediate_full_backup
      }
    }
    db_name        = each.value.database.db_name
    db_unique_name = each.value.database.db_unique_name
    db_workload    = each.value.database.db_workload
    defined_tags   = each.value.database.defined_tags
    dynamic "encryption_key_location_details" {
      for_each = each.value.database.encryption_key_location_details != null ? [each.value.database.encryption_key_location_details] : []
      content {
        aws_encryption_key_id                   = encryption_key_location_details.value.aws_encryption_key_id
        azure_encryption_key_id                 = encryption_key_location_details.value.azure_encryption_key_id
        google_cloud_provider_encryption_key_id = encryption_key_location_details.value.google_cloud_provider_encryption_key_id
        hsm_password                            = encryption_key_location_details.value.hsm_password
        provider_type                           = encryption_key_location_details.value.provider_type
      }
    }
    freeform_tags                = each.value.database.freeform_tags
    is_active_data_guard_enabled = each.value.database.is_active_data_guard_enabled
    kms_key_id                   = each.value.database.kms_key_id
    kms_key_version_id           = each.value.database.kms_key_version_id
    dynamic "managed_software_update_details" {
      for_each = each.value.database.managed_software_update_details != null ? each.value.database.managed_software_update_details : []
      content {
        is_enrolled = managed_software_update_details.value.is_enrolled
        dynamic "maintenance_details" {
          for_each = managed_software_update_details.value.maintenance_details != null ? managed_software_update_details.value.maintenance_details : []
          content {
            time_of_last_readiness_check    = maintenance_details.value.time_of_last_readiness_check
            time_of_status_update           = maintenance_details.value.time_of_status_update
            time_scheduled                  = maintenance_details.value.time_scheduled
            update_mode                     = maintenance_details.value.update_mode
            update_readiness_status         = maintenance_details.value.update_readiness_status
            update_readiness_status_details = maintenance_details.value.update_readiness_status_details
            version                         = maintenance_details.value.version
          }
        }
        dynamic "preference_details" {
          for_each = managed_software_update_details.value.preference_details != null ? managed_software_update_details.value.preference_details : []
          content {
            days_of_week = preference_details.value.days_of_week
            hour_of_day  = preference_details.value.hour_of_day
            update_mode  = preference_details.value.update_mode
            dynamic "version_scheme_details" {
              for_each = preference_details.value.version_scheme_details != null ? preference_details.value.version_scheme_details : []
              content {
                major_version      = version_scheme_details.value.major_version
                source             = version_scheme_details.value.source
                version_preference = version_scheme_details.value.version_preference
              }
            }
          }
        }
      }
    }
    ncharacter_set = each.value.database.ncharacter_set
    dynamic "patch_options" {
      for_each = each.value.database.patch_options != null ? [each.value.database.patch_options] : []
      content {
        should_skip_closed_pdbs = patch_options.value.should_skip_closed_pdbs
        should_skip_data_patch  = patch_options.value.should_skip_data_patch
      }
    }
    pdb_name                        = each.value.database.pdb_name
    pluggable_databases             = each.value.database.pluggable_databases
    protection_mode                 = each.value.database.protection_mode
    recovery_appliance_vpc_password = each.value.database.recovery_appliance_vpc_password
    sid_prefix                      = each.value.database.sid_prefix
    source_database_id              = each.value.database.source_database_id
    dynamic "source_encryption_key_location_details" {
      for_each = each.value.database.source_encryption_key_location_details != null ? [each.value.database.source_encryption_key_location_details] : []
      content {
        hsm_password  = source_encryption_key_location_details.value.hsm_password
        provider_type = source_encryption_key_location_details.value.provider_type
      }
    }
    source_tde_wallet_password = each.value.database.source_tde_wallet_password
    dynamic "storage_size_details" {
      for_each = each.value.database.storage_size_details != null ? [each.value.database.storage_size_details] : []
      content {
        data_storage_size_in_gb  = storage_size_details.value.data_storage_size_in_gb
        reco_storage_size_in_gbs = storage_size_details.value.reco_storage_size_in_gbs
      }
    }
    tde_wallet_password                   = each.value.database.tde_wallet_password
    time_stamp_for_point_in_time_recovery = each.value.database.time_stamp_for_point_in_time_recovery
    transport_type                        = each.value.database.transport_type
    vault_id                              = each.value.database.vault_id
    vm_cluster_id                         = each.value.database.vm_cluster_id
  }

  dynamic "managed_software_update_details" {
    for_each = each.value.managed_software_update_details != null ? each.value.managed_software_update_details : []
    content {
      is_enrolled = managed_software_update_details.value.is_enrolled
      dynamic "maintenance_details" {
        for_each = managed_software_update_details.value.maintenance_details != null ? managed_software_update_details.value.maintenance_details : []
        content {
          time_of_last_readiness_check    = maintenance_details.value.time_of_last_readiness_check
          time_of_status_update           = maintenance_details.value.time_of_status_update
          time_scheduled                  = maintenance_details.value.time_scheduled
          update_mode                     = maintenance_details.value.update_mode
          update_readiness_status         = maintenance_details.value.update_readiness_status
          update_readiness_status_details = maintenance_details.value.update_readiness_status_details
          version                         = maintenance_details.value.version
        }
      }
      dynamic "preference_details" {
        for_each = managed_software_update_details.value.preference_details != null ? managed_software_update_details.value.preference_details : []
        content {
          days_of_week = preference_details.value.days_of_week
          hour_of_day  = preference_details.value.hour_of_day
          update_mode  = preference_details.value.update_mode
          dynamic "version_scheme_details" {
            for_each = preference_details.value.version_scheme_details != null ? preference_details.value.version_scheme_details : []
            content {
              major_version      = version_scheme_details.value.major_version
              source             = version_scheme_details.value.source
              version_preference = version_scheme_details.value.version_preference
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

