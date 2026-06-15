<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Struts 2 K8s App</title>
</head>
<body>
    <h2>Struts 2 Kubernetes Demo Workspace</h2>
    <!-- Leverages Struts tags to display properties dynamically -->
    <p><strong>Message:</strong> <s:property value="customMessage"/></p>
</body>
</html>
