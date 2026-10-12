data "snowflake_tables" "tables_lookup" {
  for_each = var.tables_lookup

  like          = each.value.like
  starts_with   = each.value.starts_with
  with_describe = each.value.with_describe

  dynamic "in" {
    for_each = each.value.in != null ? [each.value.in] : []
    content {
      account             = in.value.account
      application         = in.value.application
      application_package = in.value.application_package
      database            = in.value.database
      schema              = in.value.schema
    }
  }

  dynamic "limit" {
    for_each = each.value.limit != null ? [each.value.limit] : []
    content {
      from = limit.value.from
      rows = limit.value.rows
    }
  }
}

