view: users {
  sql_table_name: public.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, events.count, order_items.count]
  }

dimension: region {
  case: {
    when: {
      sql: ${state} in ('WA','OR','CA','NV','UT','WY','ID','MT','CO','AK','HI') ;;
      label: "West"
    }
    when: {
      sql: ${state} in ('AZ','NM','TX','OK') ;;
      label: "Southwest"
    }
    when: {
      sql: ${state} in ('ND','SD','MN','IA','WI','MN','OH','IN','MO','NE','KS','MI','IL') ;;
      label: "Midwest"
    }
    when: {
      sql: ${state} in ('MD','DE','NJ','CT','RI','MA','NH','PA','NY','VT','ME','DC') ;;
      label: "Northeast"
    }
    when: {
      sql: ${state} in ('AR','LA','MS','AL','GA','FL','SC','NC','VA','TN','KY','WV') ;;
      label: "Southeast"
    }
    else: "Unknown"
  }
}
}
