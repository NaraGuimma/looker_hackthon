---
- dashboard: biodiversity
  title: Biodiversity
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 81J4FcrVaV2oEYYQNGuhr3
  elements:
  - title: Cities
    name: Cities
    model: biodiversity
    explore: cities
    type: looker_google_map
    fields: [cities.zip, cities.count]
    sorts: [cities.count desc 0]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    listen:
      State Name: cities.state_name
    row: 6
    col: 0
    width: 23
    height: 9
  - title: Amount of Parks per State
    name: Amount of Parks per State
    model: biodiversity
    explore: parks
    type: looker_scatter
    fields: [parks.count, parks.state]
    sorts: [parks.count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: concat("(", ${parks.latitude}, ",", ${parks.longitude}, ")")
      label: park_location
      value_format:
      value_format_name:
      dimension: park_location
      _kind_hint: dimension
      _type_hint: string
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    listen:
      State: parks.state
    row: 0
    col: 0
    width: 23
    height: 6
  - title: Species per Park
    name: Species per Park
    model: biodiversity
    explore: species
    type: looker_grid
    fields: [species.category, species.park_name, species.count]
    pivots: [species.category]
    sorts: [species.category, species.count desc 0]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_null_points: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Park Name: species.park_name
    row: 15
    col: 0
    width: 23
    height: 9
  filters:
  - name: State Name
    title: State Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: biodiversity
    explore: cities
    listens_to_filters: []
    field: cities.state_name
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: biodiversity
    explore: parks
    listens_to_filters: []
    field: parks.state
  - name: Park Name
    title: Park Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: biodiversity
    explore: species
    listens_to_filters: []
    field: species.park_name
