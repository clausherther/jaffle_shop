{%- macro generate_schema_name_for_env(custom_schema_name=none) -%}
    {%- set default_schema = target.schema -%}
    {%- if target.name == 'dev' -%}
        {{ default_schema }}_{{ custom_schema_name }}
    {%- else -%}
        {{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro -%}

{%- macro generate_schema_name(schema_name, node) -%}
    {{ generate_schema_name_for_env(schema_name) }}
{%- endmacro -%}