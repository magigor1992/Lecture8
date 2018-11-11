CREATE EVENT SESSION [QuickSessionStandard] ON SERVER 
ADD EVENT [sqlserver].[existing_connection]
    (
    SET collect_options_text = 1
    ACTION ([package0].[event_sequence],
            [sqlserver].[client_app_name],
            [sqlserver].[client_pid],
            [sqlserver].[nt_username],
            [sqlserver].[server_principal_name],
            [sqlserver].[session_id],
            [sqlserver].[client_hostname])
    ), 
ADD EVENT [sqlserver].[login]
    (
    SET collect_options_text = 1
    ACTION ([package0].[event_sequence],
            [sqlserver].[client_app_name],
            [sqlserver].[client_pid],
            [sqlserver].[nt_username],
            [sqlserver].[server_principal_name],
            [sqlserver].[session_id],
            [sqlserver].[client_hostname])
    ), 
ADD EVENT [sqlserver].[logout]
    (
    ACTION ([package0].[event_sequence],
            [sqlserver].[client_app_name],
            [sqlserver].[client_pid],
            [sqlserver].[nt_username],
            [sqlserver].[server_principal_name],
            [sqlserver].[session_id])
    ), 
ADD EVENT [sqlserver].[rpc_completed]
    (
    ACTION ([package0].[event_sequence],
            [sqlserver].[client_app_name],
            [sqlserver].[client_pid],
            [sqlserver].[database_id],
            [sqlserver].[database_name],
            [sqlserver].[nt_username],
            [sqlserver].[query_hash],
            [sqlserver].[server_principal_name],
            [sqlserver].[session_id])
    WHERE ([package0].[equal_boolean]([sqlserver].[is_system],(0)))
    ), 
ADD EVENT [sqlserver].[sql_batch_completed]
    (
    ACTION ([package0].[event_sequence],
            [sqlserver].[client_app_name],
            [sqlserver].[client_pid],
            [sqlserver].[database_id],
            [sqlserver].[database_name],
            [sqlserver].[nt_username],
            [sqlserver].[query_hash],
            [sqlserver].[server_principal_name],
            [sqlserver].[session_id])
    WHERE ([package0].[equal_boolean]([sqlserver].[is_system],(0)))
    ), 
ADD EVENT [sqlserver].[sql_batch_starting]
    (
    ACTION ([package0].[event_sequence],
            [sqlserver].[client_app_name],
            [sqlserver].[client_pid],
            [sqlserver].[database_id],
            [sqlserver].[database_name],
            [sqlserver].[nt_username],
            [sqlserver].[query_hash],
            [sqlserver].[server_principal_name],
            [sqlserver].[session_id])
    WHERE ([package0].[equal_boolean]([sqlserver].[is_system],(0)))
    ), 
ADD EVENT [sqlserver].[attention]
    (
    ACTION ([package0].[event_sequence],
            [sqlserver].[client_app_name],
            [sqlserver].[client_pid],
            [sqlserver].[database_id],
            [sqlserver].[database_name],
            [sqlserver].[nt_username],
            [sqlserver].[query_hash],
            [sqlserver].[server_principal_name],
            [sqlserver].[session_id])
    WHERE ([package0].[equal_boolean]([sqlserver].[is_system],(0)))
    )
WITH  (
        MAX_MEMORY = 8 MB,
        EVENT_RETENTION_MODE = ALLOW_SINGLE_EVENT_LOSS,
        MAX_DISPATCH_LATENCY = 5 SECONDS,
        MEMORY_PARTITION_MODE = PER_CPU,
        TRACK_CAUSALITY = ON,
        STARTUP_STATE = OFF
      );

