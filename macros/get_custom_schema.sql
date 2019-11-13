{%- macro generate_schema_name_for_env(custom_schema_name=none) -%}
    {%- set default_schema = target.schema -%}
    {{ log(default_schema, true)}}
    {{ log(custom_schema_name, true)}}
    {%- if (( target.name == 'bq' or
              target.name == 'dev' or
              target.name == 'default') and
              (custom_schema_name)) -%}
        {{ custom_schema_name | trim }}
    {%- elif custom_schema_name -%}
        {{ default_schema }}_{{ custom_schema_name }}
    {%- else -%}
        {{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro -%}

{%- macro generate_schema_name(schema_name, node) -%}
    {{ generate_schema_name_for_env(schema_name) }}
{%- endmacro -%}