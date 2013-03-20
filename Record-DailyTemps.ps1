# temp func

# read temperatures.csv to collection, if locked retry every 1 second forever, if csv not exist create empty collection

# call get temp

# if today exists in collection change it's temp to current temp

# if today not exist in collection add current date plus current temp

# write collection to temperatures.csv using safe update strat ( rename orginal .bak, new .new then .csv )

# if temperatures locked retry every 1 second forever

# does not accept command line parameters
