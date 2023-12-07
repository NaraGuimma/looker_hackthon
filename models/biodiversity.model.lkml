# Define the database connection to be used for this model.
connection: "lookerdata"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: biodiversity_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: biodiversity_default_datagroup

explore: cities {
  join: parks {
    type:  left_outer
    sql_on: CONTAINS(${cities.state_id}, ${parks.state}) ;;
    relationship: many_to_many
  }
  join: species {
    type: inner
    sql_on: ${species.park_name} = ${parks.park_name} ;;
    relationship: many_to_one
  }
}
