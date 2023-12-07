# The name of this view in Looker is "Cities"
view: cities {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `biodiversity_in_parks.cities` ;;
  drill_fields: [zip]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: zip {
    primary_key: yes
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "City" in Explore.

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_lat {
    type: sum
    sql: ${lat} ;;  }
  measure: average_lat {
    type: average
    sql: ${lat} ;;  }

  dimension: lng {
    type: number
    sql: ${TABLE}.lng ;;
  }

  dimension: state_id {
    type: string
    sql: ${TABLE}.state_id ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }
  measure: count {
    type: count
    drill_fields: [zip, state_name]
  }
}
