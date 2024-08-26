{{/*
Expand the name of the chart.
*/}}
{{- define "harness-ccm-cluster-orchestrator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "harness-ccm-cluster-orchestrator.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "harness-ccm-cluster-orchestrator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "harness-ccm-cluster-orchestrator.labels" -}}
helm.sh/chart: {{ include "harness-ccm-cluster-orchestrator.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "harness-ccm-cluster-orchestrator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "harness-ccm-cluster-orchestrator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Operator Selector labels
*/}}
{{- define "harness-ccm-cluster-orchestrator.operator.selectorLabels" -}}
{{ include "harness-ccm-cluster-orchestrator.labels" . }}
app.kubernetes.io/instance: cluster-orch-operator
app.kubernetes.io/name: cluster-orch-operator
{{- end }}

{{/*
Telemetry Selector labels
*/}}
{{- define "harness-ccm-cluster-orchestrator.telemetry.selectorLabels" -}}
{{ include "harness-ccm-cluster-orchestrator.labels" . }}
app.kubernetes.io/instance: cluster-telemetry-collector
app.kubernetes.io/name: cluster-telemetry-collector
{{- end }}

{{/*
Interrupt Selector labels
*/}}
{{- define "harness-ccm-cluster-orchestrator.interrupt.selectorLabels" -}}
{{ include "harness-ccm-cluster-orchestrator.labels" . }}
app.kubernetes.io/name: cluster-orch-interrupt-listener
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "harness-ccm-cluster-orchestrator.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "harness-ccm-cluster-orchestrator.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
