# Block 4 - Ingress und Load Balancing

Dieser kleine Integrationsbaustein setzt auf dem Stand aus Block 3 auf. Er liefert gemeinsames HTTP-Routing fuer Dashboard und API sowie eine sichtbare Dashboard-Instanzkennung.

## Verwendung im Kurs

- Privates Integrationspaket fuer das bestehende Studierenden-Repository
- Kein neues Abgabe-Repository: Die Aenderungen werden in den fortlaufenden Projektstand uebernommen
- Fuer einen reproduzierbaren Stand ist der Release `v1.0.0` zu verwenden

## Enthalten

- `deploy/overlays/block-04-ingress`: Traefik-Ingress und Skalierung des Dashboards auf zwei Replikas
- `apps/dashboard/server/routes/ui-instance.get.ts`: liefert den aktuellen Podnamen
- `apps/dashboard/pages/index.vue`: zeigt die bedienende Instanz im Kopf des Dashboards

## Arbeitsauftrag

1. Die Dateien in das eigene System-Repository integrieren; `index.vue` bei eigenen Aenderungen zusammenfuehren.
2. Pfadregeln fuer `/`, `/api`, `/health` und `/metrics` erklaeren und testen.
3. Den Unterschied zwischen Service-Load-Balancing und Ingress-Routing nachweisen.
4. Mehrfach `/ui-instance` abrufen und die Verteilung auf zwei Dashboard-Pods beobachten.
5. Einen Dashboard-Pod waehrend laufender Requests entfernen.

```bash
kubectl --context k3d-delivery-lab apply -k deploy/overlays/block-04-ingress
curl http://localhost:8080/ui-instance
```

Abnahme: Das Gesamtsystem ist unter einer URL erreichbar und beide Dashboard-Replikas bedienen Requests.
