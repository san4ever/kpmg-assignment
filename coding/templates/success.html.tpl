{{- define "successPage" -}}

{{- template "header" . -}}

<p>
    Hello from Google Cloud Datacenters at
    <code>{{.region_code}}</code>
</p>

{{ with .region_geo}}
    <h1>{{.}}</h1>
{{ end }}

{{ with .flag_url }}
    <img class="flag" src="{{.}}"/>
    <img class="mascot" src="/static/mascot.svg"/>
{{ end}}

<hr/>
<p class="light">
    Based on where you visit from, Google Cloud Load Balancer routes your request
    to the closest compute region the application is deployed in.
</p>
<p class="light">
    Find the source code <a href="https://github.com/san4ever/kpmg-assignment">here</a>.
</p>

{{- template "footer" . -}}

{{- end -}}
