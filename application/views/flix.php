<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
        var t = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzZWN1cmUuand0LmRhdy5sb2NhbCIsImp0aSI6IjExNTJlNDQxLTQ2OTEtNTU2ZC1iMWFiLTgxMTNmYjVmZjE4NCIsInVzciI6IjE5IiwiaWF0IjoxNjIyNDg3MzM0LCJleHAiOjE2MjI0ODc2MzR9.xcMSUG0kAvnvuHBTDdXnSbhURuZNaU_RhUVFcBMvhk0';

        function parseJwt(token) {
            var base64Url = token.split('.')[1];
            var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
            var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
                return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
            }).join(''));

            return JSON.parse(jsonPayload);
        };

        var ret=parseJwt(t);
        console.log(ret);
        console.log('finito');
    </script>
</head>

<body>

</body>

</html>