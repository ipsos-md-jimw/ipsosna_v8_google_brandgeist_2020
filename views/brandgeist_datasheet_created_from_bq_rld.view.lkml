view: brandgeist_datasheet_created_from_bq_rld {
  sql_table_name: `Brandgeist.Brandgeist_Datasheet_Created_From_BQ_RLD`
    ;;

  dimension: _95_cl_lower {
    type: number
    sql: ${TABLE}._95_cl_lower ;;
  }

  dimension: _95_cl_upper {
    type: number
    sql: ${TABLE}._95_cl_upper ;;
  }

  dimension: base_note {
    type: string
    sql: ${TABLE}.baseNote ;;
  }

  dimension: brand_code {
    type: string
    sql: ${TABLE}.brandCode ;;
  }

  dimension: brand_label {
    type: string
    sql: ${TABLE}.brandLabel ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.countryCode ;;
  }

  dimension: difference_wow {
    type: number
    sql: ${TABLE}.difference_wow ;;
  }

  dimension: difference_yoy {
    type: number
    sql: ${TABLE}.difference_yoy ;;
  }

  measure: effective_base {
    type: sum
    sql: ${TABLE}.effectiveBase ;;
    value_format_name: decimal_0
  }

  dimension: hidden_sort {
    type: number
    sql: ${TABLE}.hiddenSort ;;
  }

  dimension: metric_code {
    type: string
    primary_key: yes
    sql: ${TABLE}.metricCode ;;
  }

  dimension: metric_without_brand {
    type: string
    sql: REPLACE(${metric_code},CONCAT('_',${brand_code}),'') ;;
  }

  dimension: metric_label {
    type: string
    sql: ${TABLE}.metricLabel ;;
  }

  dimension: metric_type {
    type: string
    sql: ${TABLE}.metricType ;;
  }

  dimension: metric_value {
    type: number
    sql: ${TABLE}.metricValue ;;
  }

  dimension: product_category_code {
    type: string
    sql: ${TABLE}.productCategoryCode ;;
  }

  dimension: product_category_label {
    type: string
    sql: ${TABLE}.productCategoryLabel ;;
  }

  dimension: project {
    type: string
    sql: ${TABLE}.project ;;
  }

  dimension: response_codes {
    type: string
    sql: ${TABLE}.responseCodes ;;
  }

  dimension: response_label {
    type: string
    sql: ${TABLE}.responseLabel ;;
  }

  dimension: small_base_flag {
    type: string
    sql: ${TABLE}.small_base_flag ;;
  }

  dimension: stat_test_wow {
    type: string
    sql: ${TABLE}.stat_test_wow ;;
  }

  measure: stat_result {
    type: sum
    sql: CASE ${stat_test_wow}
          WHEN 'Increase' THEN 1
          WHEN 'Decrease' THEN -1
          WHEN 'No change' THEN 0
          WHEN 'N/A' THEN 2
          END
    ;;
  }

  measure: stat_result_number {
    type: number
    sql: SUM(${stat_result}) OVER ( PARTITION BY ${wave_label})
    ;;
  }

  dimension: stat_test_yoy {
    type: string
    sql: ${TABLE}.stat_test_yoy ;;
  }

  dimension: stats_type {
    type: string
    sql: ${TABLE}.stats_type ;;
  }

  dimension: subgroup {
    type: string
    sql: ${TABLE}.subgroup ;;
  }

  dimension: time_series {
    type: string
    sql: ${TABLE}.timeSeries ;;
  }

  measure: unweighted_base {
    type: sum
    sql: ${TABLE}.unweightedBase ;;
  }

  dimension: wave_code {
    type: string
    sql: ${TABLE}.waveCode ;;
  }

  dimension: wave_label {
    type: string
    sql: ${TABLE}.waveLabel ;;
  }

  measure: weighted_base {
    type: sum
    sql: ${TABLE}.weightedBase ;;
    value_format_name: decimal_0
  }

  measure: weighted_count {
    type: sum
    sql: ${TABLE}.weightedCount ;;
    value_format_name: decimal_0
  }
}
