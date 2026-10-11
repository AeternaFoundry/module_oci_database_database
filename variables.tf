variable "database_databases" {
  description = <<EOT
Map of database_databases, attributes below
Required:
    - source
    - database (block):
        - admin_password (optional)
        - auto_failover_configuration (optional, block):
            - failover_targets (optional)
            - managed_auto_failover (optional)
        - backup_id (optional)
        - backup_tde_password (optional)
        - character_set (optional)
        - database_admin_password (optional)
        - database_id (optional)
        - database_software_image_id (optional)
        - db_backup_config (optional, block):
            - auto_backup_enabled (optional)
            - auto_backup_window (optional)
            - auto_full_backup_day (optional)
            - auto_full_backup_window (optional)
            - backup_deletion_policy (optional)
            - backup_destination_details (optional, block):
                - backup_retention_policy_on_terminate (optional)
                - dbrs_policy_id (optional)
                - id (optional)
                - is_remote (optional)
                - is_retention_lock_enabled (optional)
                - is_zero_data_loss_enabled (optional)
                - remote_region (optional)
                - tde_wallet_backup_destination (optional, block):
                    - backup_destination_id (optional)
                    - backup_destination_type (optional)
                - type (optional)
                - vpc_password (optional)
                - vpc_user (optional)
            - recovery_window_in_days (optional)
            - run_immediate_full_backup (optional)
        - db_name (optional)
        - db_unique_name (optional)
        - db_workload (optional)
        - defined_tags (optional)
        - encryption_key_location_details (optional, block):
            - aws_encryption_key_id (optional)
            - azure_encryption_key_id (optional)
            - google_cloud_provider_encryption_key_id (optional)
            - hsm_password (optional)
            - provider_type (required)
        - freeform_tags (optional)
        - is_active_data_guard_enabled (optional)
        - kms_key_id (optional)
        - kms_key_version_id (optional)
        - managed_software_update_details (optional, block):
            - is_enrolled (optional)
            - maintenance_details (optional, block):
                - time_of_last_readiness_check (optional)
                - time_of_status_update (optional)
                - time_scheduled (optional)
                - update_mode (optional)
                - update_readiness_status (optional)
                - update_readiness_status_details (optional)
                - version (optional)
            - preference_details (optional, block):
                - days_of_week (optional)
                - hour_of_day (optional)
                - update_mode (optional)
                - version_scheme_details (optional, block):
                    - major_version (optional)
                    - source (optional)
                    - version_preference (optional)
        - ncharacter_set (optional)
        - patch_options (optional, block):
            - should_skip_closed_pdbs (optional)
            - should_skip_data_patch (optional)
        - pdb_name (optional)
        - pluggable_databases (optional)
        - protection_mode (optional)
        - recovery_appliance_vpc_password (optional)
        - sid_prefix (optional)
        - source_database_id (optional)
        - source_encryption_key_location_details (optional, block):
            - hsm_password (optional)
            - provider_type (required)
        - source_tde_wallet_password (optional)
        - storage_size_details (optional, block):
            - data_storage_size_in_gb (required)
            - reco_storage_size_in_gbs (required)
        - tde_wallet_password (optional)
        - time_stamp_for_point_in_time_recovery (optional)
        - transport_type (optional)
        - vault_id (optional)
        - vm_cluster_id (optional)
Optional:
    - action_trigger
    - data_guard_action
    - db_home_id
    - db_version
    - key_store_id
    - kms_key_id
    - kms_key_migration
    - kms_key_rotation
    - kms_key_version_id
    - vault_id
    - vm_cluster_id
    - managed_software_update_details (block):
        - is_enrolled (optional)
        - maintenance_details (optional, block):
            - time_of_last_readiness_check (optional)
            - time_of_status_update (optional)
            - time_scheduled (optional)
            - update_mode (optional)
            - update_readiness_status (optional)
            - update_readiness_status_details (optional)
            - version (optional)
        - preference_details (optional, block):
            - days_of_week (optional)
            - hour_of_day (optional)
            - update_mode (optional)
            - version_scheme_details (optional, block):
                - major_version (optional)
                - source (optional)
                - version_preference (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    source             = string
    action_trigger     = optional(number)
    data_guard_action  = optional(string)
    db_home_id         = optional(string)
    db_version         = optional(string)
    key_store_id       = optional(string)
    kms_key_id         = optional(string)
    kms_key_migration  = optional(bool)
    kms_key_rotation   = optional(number)
    kms_key_version_id = optional(string)
    vault_id           = optional(string)
    vm_cluster_id      = optional(string)
    database = object({
      admin_password = optional(string)
      auto_failover_configuration = optional(object({
        failover_targets      = optional(list(string))
        managed_auto_failover = optional(string)
      }))
      backup_id                  = optional(string)
      backup_tde_password        = optional(string)
      character_set              = optional(string)
      database_admin_password    = optional(string)
      database_id                = optional(string)
      database_software_image_id = optional(string)
      db_backup_config = optional(object({
        auto_backup_enabled     = optional(bool)
        auto_backup_window      = optional(string)
        auto_full_backup_day    = optional(string)
        auto_full_backup_window = optional(string)
        backup_deletion_policy  = optional(string)
        backup_destination_details = optional(list(object({
          backup_retention_policy_on_terminate = optional(string)
          dbrs_policy_id                       = optional(string)
          id                                   = optional(string)
          is_remote                            = optional(bool)
          is_retention_lock_enabled            = optional(bool)
          is_zero_data_loss_enabled            = optional(bool)
          remote_region                        = optional(string)
          tde_wallet_backup_destination = optional(object({
            backup_destination_id   = optional(string)
            backup_destination_type = optional(string)
          }))
          type         = optional(string)
          vpc_password = optional(string)
          vpc_user     = optional(string)
        })))
        recovery_window_in_days   = optional(number)
        run_immediate_full_backup = optional(bool)
      }))
      db_name        = optional(string)
      db_unique_name = optional(string)
      db_workload    = optional(string)
      defined_tags   = optional(map(string))
      encryption_key_location_details = optional(object({
        aws_encryption_key_id                   = optional(string)
        azure_encryption_key_id                 = optional(string)
        google_cloud_provider_encryption_key_id = optional(string)
        hsm_password                            = optional(string)
        provider_type                           = string
      }))
      freeform_tags                = optional(map(string))
      is_active_data_guard_enabled = optional(bool)
      kms_key_id                   = optional(string)
      kms_key_version_id           = optional(string)
      managed_software_update_details = optional(list(object({
        is_enrolled = optional(bool)
        maintenance_details = optional(list(object({
          time_of_last_readiness_check    = optional(string)
          time_of_status_update           = optional(string)
          time_scheduled                  = optional(string)
          update_mode                     = optional(string)
          update_readiness_status         = optional(string)
          update_readiness_status_details = optional(string)
          version                         = optional(string)
        })))
        preference_details = optional(list(object({
          days_of_week = optional(list(string))
          hour_of_day  = optional(number)
          update_mode  = optional(string)
          version_scheme_details = optional(list(object({
            major_version      = optional(string)
            source             = optional(string)
            version_preference = optional(string)
          })))
        })))
      })))
      ncharacter_set = optional(string)
      patch_options = optional(object({
        should_skip_closed_pdbs = optional(bool)
        should_skip_data_patch  = optional(bool)
      }))
      pdb_name                        = optional(string)
      pluggable_databases             = optional(list(string))
      protection_mode                 = optional(string)
      recovery_appliance_vpc_password = optional(string)
      sid_prefix                      = optional(string)
      source_database_id              = optional(string)
      source_encryption_key_location_details = optional(object({
        hsm_password  = optional(string)
        provider_type = string
      }))
      source_tde_wallet_password = optional(string)
      storage_size_details = optional(object({
        data_storage_size_in_gb  = number
        reco_storage_size_in_gbs = number
      }))
      tde_wallet_password                   = optional(string)
      time_stamp_for_point_in_time_recovery = optional(string)
      transport_type                        = optional(string)
      vault_id                              = optional(string)
      vm_cluster_id                         = optional(string)
    })
    managed_software_update_details = optional(list(object({
      is_enrolled = optional(bool)
      maintenance_details = optional(list(object({
        time_of_last_readiness_check    = optional(string)
        time_of_status_update           = optional(string)
        time_scheduled                  = optional(string)
        update_mode                     = optional(string)
        update_readiness_status         = optional(string)
        update_readiness_status_details = optional(string)
        version                         = optional(string)
      })))
      preference_details = optional(list(object({
        days_of_week = optional(list(string))
        hour_of_day  = optional(number)
        update_mode  = optional(string)
        version_scheme_details = optional(list(object({
          major_version      = optional(string)
          source             = optional(string)
          version_preference = optional(string)
        })))
      })))
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.database_databases : (
        v.database.auto_failover_configuration == null || (v.database.auto_failover_configuration.managed_auto_failover == null || (contains([for v in ["ENABLE", "DISABLE"] : lower(v)], lower(v.database.auto_failover_configuration.managed_auto_failover))))
      )
    ])
    error_message = "must be one of: \"ENABLE\", \"DISABLE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.database_databases : (
        v.database.db_backup_config == null || (v.database.db_backup_config.backup_destination_details == null || alltrue([for item in v.database.db_backup_config.backup_destination_details : (item.type == null || (contains([for v in ["AWS_S3", "DBRS", "OBJECT_STORE", "NFS", "RECOVERY_APPLIANCE", "LOCAL"] : lower(v)], lower(item.type))))]))
      )
    ])
    error_message = "must be one of: \"AWS_S3\", \"DBRS\", \"OBJECT_STORE\", \"NFS\", \"RECOVERY_APPLIANCE\", \"LOCAL\""
  }
  validation {
    condition = alltrue([
      for k, v in var.database_databases : (
        v.database.encryption_key_location_details == null || (contains([for v in ["AWS", "AZURE", "GCP", "EXTERNAL"] : lower(v)], lower(v.database.encryption_key_location_details.provider_type)))
      )
    ])
    error_message = "must be one of: \"AWS\", \"AZURE\", \"GCP\", \"EXTERNAL\""
  }
  validation {
    condition = alltrue([
      for k, v in var.database_databases : (
        v.database.source_encryption_key_location_details == null || (contains([for v in ["AWS", "AZURE", "GCP", "EXTERNAL"] : lower(v)], lower(v.database.source_encryption_key_location_details.provider_type)))
      )
    ])
    error_message = "must be one of: \"AWS\", \"AZURE\", \"GCP\", \"EXTERNAL\""
  }
  validation {
    condition = alltrue([
      for k, v in var.database_databases : (
        contains([for v in ["DATABASE", "DATAGUARD", "DB_BACKUP", "NONE"] : lower(v)], lower(v.source))
      )
    ])
    error_message = "must be one of: \"DATABASE\", \"DATAGUARD\", \"DB_BACKUP\", \"NONE\""
  }
}

