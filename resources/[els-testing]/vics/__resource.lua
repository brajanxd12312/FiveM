resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
 
files {
    'data/vehicles.meta',
    'data/lspd_vehicles.meta',
    'data/vehicles_add.meta',
    'data/carvariations.meta',
    'data/carvariations_add.meta',
    'data/lspd_carvariations.meta',
    'data/boat_carvariations.meta',
}
 
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles_add.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/lspd_vehicles.meta'
--data_file 'VEHICLE_METADATA_FILE' 'data/boat_vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations_add.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/lspd_carvariations.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/boat_carvariations.meta'