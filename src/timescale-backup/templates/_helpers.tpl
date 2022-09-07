{* {{- define "timescaledb.adminPassword" -}}
{{- if .Values.global -}}
    {{- if .Values.global.timescaledb.adminPassword -}}
        {{- if .Values.global.timescaledb.adminPassword -}}
            {{- .Values.global.timescaledb.adminPassword -}}
        {{- else -}}
            {{- ternary (randAlphaNum 10) .Values.timescaledb.adminPassword (empty .Values.timescaledb.adminPassword) -}}
        {{- end -}}
    {{- else -}}
        {{- ternary (randAlphaNum 10) .Values.timescaledb.adminPassword (empty .Values.timescaledb.adminPassword) -}}
    {{- end -}}
{{- else -}}
    {{- ternary (randAlphaNum 10) .Values.timescaledb.adminPassword (empty .Values.timescaledb.adminPassword) -}}
{{- end -}}
{{- end -}}

{{- define "timescaledb.postgresPassword" -}}
{{- if .Values.global -}}
    {{- if .Values.global.timescaledb -}}
        {{- if .Values.global.timescaledb.postgresPassword -}}
            {{- .Values.global.timescaledb.postgresPassword -}}
        {{- else -}}
            {{- ternary (randAlphaNum 10) .Values.timescaledb.postgresPassword (empty .Values.timescaledb.postgresPassword) -}}
        {{- end -}}
    {{- else -}}
        {{- ternary (randAlphaNum 10) .Values.timescaledb.postgresPassword (empty .Values.timescaledb.postgresPassword) -}}
    {{- end -}}
{{- else -}}
    {{- ternary (randAlphaNum 10) .Values.timescaledb.postgresPassword (empty .Values.timescaledb.postgresPassword) -}}
{{- end -}}
{{- end -}}

{{- define "timescaledb.standbyPassword" -}}
{{- if .Values.global -}}
    {{- if .Values.global.timescaledb -}}
        {{- if .Values.global.timescaledb.standbyPassword -}}
            {{- .Values.global.timescaledb.standbyPassword -}}
        {{- else -}}
            {{- ternary (randAlphaNum 10) .Values.timescaledb.standbyPassword (empty .Values.timescaledb.standbyPassword) -}}
        {{- end -}}
    {{- else -}}
        {{- ternary (randAlphaNum 10) .Values.timescaledb.standbyPassword (empty .Values.timescaledb.standbyPassword) -}}
    {{- end -}}
{{- else -}}
    {{- ternary (randAlphaNum 10) .Values.timescaledb.standbyPassword (empty .Values.timescaledb.standbyPassword) -}}
{{- end -}}
{{- end -}} *}
