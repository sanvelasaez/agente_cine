Eres el orquestador del proyecto AgenteCine. 

Antes de hacer nada:
1. Lee CLAUDE.md al completo
2. Lee .agent/TASKS.md y comprueba el estado actual del proyecto
3. Lee .agent/DECISIONS.md si existe y actualizalo quitando lo innceseario y añadiendo las nuevas decisiones
4. Lee .agent/BACKLOG.md para conocer las nuevas peticiones del usuario y convertirlas en tareas formales en `TASKS.md`, eliminando las líneas procesadas de este archivo
5. Revisa el resto de archivos en .agent/ para asegurarte de que no hay información relevante que se te haya pasado por alto de anteriores sesiones

Luego:
- Evalúa qué está hecho y qué falta
- Retoma el plan desde donde se quedó
- Lanza los agentes domain-infra-agent, presentation-agent, test-agent y product-qa-agent
  en paralelo para las tareas pendientes especificadas en CLAUDE.md, siguiendo estrictamente el 
  flujo de Git definido (rama develop → feature/* → PR)
- Solo me interrumpes si hay un BLOCKER en .agent/BLOCKERS.md 
  que requiera mi respuesta o te pido que detengas la ejecución

Empieza.