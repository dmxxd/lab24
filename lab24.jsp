<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Лабораторная работа №24</title>
</head>
<body>
    <h2>Вычисление суммы ряда</h2>
    
    <form method="post">
        x: <input type="text" name="x"><br>
        Верхний предел: <input type="text" name="lim"><br>
        <input type="submit" value="Вычислить">
    </form>
    <%
        String xParam = request.getParameter("x");
        String limParam = request.getParameter("lim");
        
        if (xParam != null && limParam != null) {
            try {
                double x = Double.parseDouble(xParam);
                int lim = Integer.parseInt(limParam);
                
                if (lim <= 0) {
                    out.println("Верхний предел должен быть > 0");
                } else {
                    double sum = 0;
                    for (int n = 0; n < lim; n++) {
                        long fact = 1;
                        for (int i = 1; i <= n; i++) fact *= i;
                        sum += (Math.pow(-1, n) * Math.pow(x, 2 * n)) / fact;
                    }
                    out.println("Сумма: " + sum);
                }
            }
        }
    %>
</body>
</html>
