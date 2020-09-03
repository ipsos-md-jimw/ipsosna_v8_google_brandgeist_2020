connection: "brandgeist_preaggregated"

# include all the views
include: "/views/**/*.view"

datagroup: ipsosna_v8_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ipsosna_v8_default_datagroup

explore: brandgeist_datasheet_created_from_bq_rld {}
