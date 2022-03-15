<%-- 
    Document   : list
    Created on : Mar 12, 2022, 6:29:32 AM
    Author     : doan7
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../js/staff.js" type="text/javascript"></script>
        <script src="../js/newjavascript.js" type="text/javascript"></script>
        <script>
            function doUpdate(sid){
            window.location.href = "update?sid="+sid;
            }

            function doDelete(sid){
            var c = confirm("Are you sure ?");
                if(c){
                window.location.href = "delete?sid="+sid;
                }
            }
        </script>
    </head>
    <style>
        img{
            width: 30px;
            height: 30px;
        }
        .pagger{
            margin-top: 30px;
        }
        .pagger a{
    border: 1px solid aliceblue;
    border-radius: 2px;
    padding: 2px;
    background-color: #7E8184;
    margin-left: 5px;
    margin-right: 5px;
}
        .pagger span{
    font-weight: bold;
    border: 1px solid aliceblue;
    background-color: blue;
    border-radius: 2px;
    padding: 2px;
}
    </style>
    <body>
    
        <c:url value="/home/food" var="home"/>
       
        <table border="1px">
            <tr>
                
                <td>ID</td>
                <td>Name</td>
                <td>DOB</td>
                <td>Gender</td>
                <td>Salary</td>
                <td>Phone</td>
                
                <td>Update Informations of Staff</td>
                <td>Delete Staff from List</td>
            </tr>
            <c:forEach items="${requestScope.Staffs}" var="s">
                <tr>
                    <td>${s.id}</td>
                    <td>${s.name}</td>                    
                    <td>${s.DOB}</td>
                    <td><c:if test="${s.gender}">
                            <img  src="https://banner2.cleanpng.com/20180422/aww/kisspng-gender-symbol-male-computer-icons-symbol-design-5adc50a60a0d82.5175241215243880060412.jpg"/>
                    </c:if>
                    <c:if test="${!s.gender}">
                            <img  src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExIVFRUWFxUaGBcYFxcXGBYaHRcWGRcVFRcZHSggGB0lGxcXITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGxAQGzUmICYtLS0rNzAtNy0rLS0tKy0wKy0vMC0rLS0tNS0uLS0tLSswLS0rLi0tLS0tLS0tLS0tLf/AABEIAPEA0QMBIgACEQEDEQH/xAAbAAEAAwADAQAAAAAAAAAAAAAAAQYHAgQFA//EAEEQAAECAwQHBQYFAwMEAwAAAAEAAgMRIRIxMkEEBiJRYYGhBUJxkfAHExRiwdFSkrGy4RVy0iOCoiQzU4M0RHP/xAAbAQEAAwEBAQEAAAAAAAAAAAAABAUGAwcCAf/EAD8RAAEDAgEHCAgFAwUBAAAAAAEAAgMEESEFEjFBUXGBUmGRobHB0fAGExQVIkJT4RYyM3LxNJLSgqKywuJi/9oADAMBAAIRAxEAPwDaHG3QUkk5ixn9kdXBf5KaSkMXqdURAZbO/wCqN2L6zQbji9SUNpj5ZoikCztb0+fJB812SZz7vrJEQi1UZITbupJL8N3kuvp2mQ4bbTnNa0XkmzyE7/AJpX6ASbDSuxOez6ogMtn1VUvtbX6EykGGXn8TqDxABtHoqpp+tulRb4jmjcybOrb/ADVhFkyd+JGbv8Fc0+QaqXF1mjn09Ax4Gy1qLpLIQ23taN7nBv6ledF1k0SGdqOzkS79oKx18RxNXEk5mp81xJU1uSGfM8ncAPFWsfo1EPzyE7gB4rWTrlodqfvSf9jlyGuGhuM/ey8WP+gWRounumDaekf4rv8Ahyj2u6R/itohaw6JFlLSIfM2f3SXfhaQ2IJMc1w3ggjosJBX0g6Q9hm17gd4cQfMLk7JDPleeIB8OxR5fRqM/pyEbwD2WW7TkLGaA2KGqybs/XPSod7/AHg3PBd/yxdVbOyNeoESTYwLHb8TPO8eXNQpsmzx6Bfd4aVU1GQ6uLFozh/86ejT0Aq2gWKmqi7by+6+ejxmuaHBwe03EEOB8CF9eJw+pUUBU6ET2t30R23dSScRh9ToodXBzyRFJNrZ3JPuZoa4b88kyl3vWaIgdZoc0aLF9ZoJDFf5qG0x8s0RcviBuKJaZw8kRFDhLDXqksxi3frRJWK3zUSlt9PFEUgTqb/UqI2uKm7JRK1tbsvBTj4SREBnR13khOXd38PFfLSdJa1ri5wY1gmXG4ALNNadbXxpwoZLIQvyc/i4jLh58JNNSvqHWbo1nZ4nmU+gydLWPszADSdQ8TzdisGsWuzIU4ejye6s3XsBzsyNT08Vn2n9oxIrrUR7nHibuAF0uAXWJULR09LHAPgGO3X9twstxR5PgpG2jGOsnSePcERFLWk3KQpqhF6fZ+r2kxqw4TiD3i2TfzGQK9zRdQI78T4bf9xJ6CXVcH1MMeDnAcfC6iTV1PCbSPAO/HoFz1KoIr432dVkdIHJhP1XGN7OiDIRwfEEfUrl7wpuX1HwUf3zQ/V6nf4qiorZpeoOkMGy5kTwdInk4AdV4en9i6RC/wC5Cc0by02eRu6rtHURSYMcDx7tKlQ1kE2EbwTsvj0aV56KSFC7KSu/2V2zG0d1pjyN7bw7+4XHxvWjau63w9IAZEIhxN05NN2Em48D1WVKWuIqFFqaOOcfELHaNP3VdW5Mgqx8Ys7lDTx27jwst6NKC71OqOphrvzWe6pa5ESg6QZtMg15vbcJOJNW8bx+mgNeAARtA1n9vNZyop3wOzX8NhWIraGWkkzJOB1FciJVbf5pLPvbv4SVnavmku/0XBQ0aJ1dQ+SNrip0SzardJAbfCSIp923f1RR8PxUoihos31SUtrLcn99yVzw+pIiSntC5cI0UAF0w0NBJJoAN58lzPDDn9VQvaF2/wD/AFoRlcYhG/8AByvPIb13p4HTSBg48wUuio31cwjbxOwaz3DnK8fXDWY6Q/3bJiE00F1o/idvpcMlWVKhamKJsbQxowC9EggZBGI4xYDzjzopAUsbaoKk3DfwC0bVXU5jAIukNm68MIo3i8HPhcP0+KioZA3Odw2nztXCtroqRmfIdw1nzrPfYGt6v6oRo4D3f6cM95wIJHyjveJkPFX3svVnR4Ei1gdKtp8nOpfISkOS9occOX0Q8MPqaz1RXSzYXsNg79vZzLF1mV6ipuL5rdg7zr44bAEcLV1JI42qChQ/Jz9FDLu3qGqtJ93PejXWaG9P3IPmvy+iIjdnFWaizKpq05X38FI+fl9bkHHDl9ERV3tfU7R483Nb7p29jQBzbnyks/7b1ajaPVzbTJyD2zc3hM5Hgeq2Lww+prhHhBwLZAtIkQQCDwIKnU+UJYsCc4bD3H+RzK3ostVFOQHHObsJx4HSOzmWEKFedb9Tg21G0duzUuZeW3zc0Zt4Xjwuo5EloIJ2TMzmHxG9bSkq4qqP1kZw17QdhQFXXUbWqwRo8Z02XMce4abLie6enhdSVIMl+zQtmYWO/hftVSx1MZjkGHWDtHnmW9AWam5JVtZblUtQ+3vfMEGI6b2ChObaAeJH2Vt/asrNE6J5Y7V5uvO6qmfTSuifpHWNR4/bUkrVRQI42rqIZ925D8nNclHUe4dv6lE2/UkRFLTavok57OW9CbdLpJOex18ERebrB2kNGgPfQ0k2ebjcOk+RWMRohcS5xmSSSd5NSVdPaV2jtt0cGjRad/cZyn4CXmVSVpMmwerizjpd2avFbnIVIIab1h/M/Hh8o7+KKQFCsOpXY3xEYFwmyHJzuMiJM5noCpsj2xsL3aAraaZkMbpH6ALnzz6ArNqHqyGtGkRRtGVgHuihDzxOW4eNLo02r6SSVqopKkkx8JLJzzOmeXu/jmXnNXVSVMpkfwGoDYPOOkoDPZN32QmWyLvuk57PXwSctnr4rkoyONm6s0cLNRUpg4zSzZrfNESVLWe5ALVTeku/0Qi1tXSREbtX0kgM9k3IdvhJJ2tnd9ERJ93LehNmgqonLY6+KkGxS9ER2zdVZzr5q37v/qIQkwnbaO64zqPwtJ8j4rRg2xW+a+Wk6O17XWwHNcCC3eDSXVSKaodA/OHEbR5xCm0Fa+klDxo1jaPOI5+YlYSi9Dt/s0wIz4dSJmyfxA4T5dQV561bXBwDhoK9EY9sjQ9puCLjcV2+ytPdBjMiNNWkHxGYPAiY5radC0psSG1zate0EHORE68clha0n2bdpW4ToBO00kj+0yBHJ37lV5VgzoxINI7D4HtVD6Q0mfCJxpbp/afA9pVyJs0FQjhZurNAbNL5oBY4zVAsYo9+7d0KKfiOClEUEzw06ISJS72/9ao6mG/zXT7YiWNHivGL3b/Oycl+gXNl9NaXuDRrw6Vj3bmle9jxIhM7TnEfmp9F0VyeanxXFbINDRYaBh0L1FrAwBrdAwG4KQFrGo3ZvutGa4isTbd4Sk0eVeayvQ4RfEYwXkgDxnL6rcoMOyAwYGgAbpASvVTleSzGs249HnqWc9JJy2JkQ+YkncNHST1L6ETq2g8kNcNOiGmG7zUOpg55qiWPUznQYvU6oDKhxepVSkpjF6nRBK84vUqIiCmKvVAJVdd5qG1x8slIriu8kRJZ93d/CETq27yTOXd9ZoaYbvNEQ1w035ITOgv9TqodTBzzUneMXqdERJ5HFv8A0qgMsVeqZTOL1KiNkcV/kiI0SxV6pxOH1KigVx3eSngcPqVURUz2k9nB8JsdowGyf7akT8HfuWbratYNHt6PGZKYMN5GdQLQ6gLFnCpWhyVJnQ5p+U9Rx8VtvR6cyUpYflNuBxHXfgoVh1F00w9LYJyD5w/zXdQ1V5ffQIxZFY8XhzT5EH6KwkZnsLdoIVzPF66N0fKBHTgt0BlR1/mjaYq9UaQRN1+WVEbXHyyWOXmCn3jN3REsM4eaIigixUVmvI1vMtDjO3tHVzR9V67RYqc15GtsKehxj8k+oK60/wCq3eO0KTR2FRHflN7QscKhSVC169LXqarielQP/wBYf7mn6LZp1sZLGNWXAaVAO6JD/e2a2edLGaocr/qN3d6yHpL+rHuPapLrNN6EWLqzRps0OaNFi+s1UrNJKW16qgE9r1RAJbWX3Qie1l9kRALd9JIHWqbkcLd1JI42qDJESfcQmzs70nSxmgNnZOaIh2LqzQiztb/qjdi+s0As7W/6oiiU9v1RALdTRL9vL7IRbqKIiNNuhpJTanseqI426CiicxYz+yIoeKFmRH6rCYw2iOK3SPEDGOnkCZ8lhcXEfEq7yPofw71q/Rj8s3+n/suC5w8Q8QuC5w8Q8QroaVq2/mC3Ds7ahQyf/HD/AGg/Vdhpt30kvhoUOcOH8rGjyAX3Jt3UksUdK8qcRnGyn4cb0XH4c7wiL8QUx3ea6vacIvhRWi50N4HNpAp4yXbBnip0QHLu+s0BINwv1ri0hw0hYNEFT4rivV1o0L3WlRWSkLRLf7TtN6HovKWya4PaHDXj0r1FkgkaHt0EAjccVzguIc03EGY8Rcty0SOHw2Oze1rhzE71hS0/2edpB+j+7J2oRMuLDUeRJHkq3K0ZdGHjV3/wqD0jp8+Bso+U47nWHaAOKtgkMV/mobTHyzUgTq6h8kbtYqdFn1jE4nD6lROIw+p0QGdDh9SqhMqDD6nVEUOrg55KXSOG/wAkds4a9UcJVbU+aImUu96zQfNfl9Eln3t38IBOpv8AJEUNpj5ZqRxw5fRQ3axU3ZKQZ0N3qVUROIw+p0UGuC7yUzy7u/8AlHGWGvVEUOrgv8lNJSGL1OqEWcNeqSz727+EReVrPpYhaJFJxFjmjfNws/zyWNONVfPaX2nggi/G7qGjytH/AHBUJaPJcWZDnH5jfhq7+C3OQKcxUucdLjfhoHeeKLudkaP7yNDZ+J7G+bgF01ZvZ5oHvNKBOGGC8+IkG1yqQeSmzSerjc/YP461aVUwhhdJsBPHV1rVSPw3eSh1cHPJTOVG1Hmh2cNeqx68yXGy/j5op947d0REUzt0ulzUWp7HXwUk2sNEnPZz3oiontM7L/7cZo+Rx/MWn9w5BZ+tx7R0NsWG+E+oeJT3bj4gyPJYx2loToMR8NwkWkg/QjgRI81oclz58fqzpb2fY4dC2vo/Wesg9SdLNH7To6Dh0Lqr1NW+1jo0dr723OH4mk1H6HxAXlorFzQ5pa7QVeSRtkaWOxBFit3gRGxGiI0zaQCCKzF4PVfSdvhLmsz1J1l90RAiukxx2XfgJ38D+td60wm1h9eSytVTOgkzTo1HaPOled19C+jlzHaPlO0eI0EbeYhLU9ndn4JOWz18UJnsi/f4I0y2Tfv8blHUJJ2OM+SizYrfNSDZxV6pKzU1CIku/wBEla2rpJLvZbkInUXIiY+EuaidrZ3Z+Ck7WGkuSEzoL0RROWx18VNqxS9J93PegNnFVESVit8+S6nammsgQ3RnGjROVJuJFGjiSvtFjCE0viOAaBMkmg4mayvW7WE6S+y2YhMJst337Thv3bh4lS6OldO+2oafDeVY5Mye6slt8o/Me7efuvG7S0x0aI+K4zLi49aAcAKcl1kRakAAWC9Ca0NFhoUrUPZ92b7rR7ThJ0Yz8GyEvPaPkqHqx2Q7SY7WZXuduaDU87hxK2SEwNaIYEpAASuAFw8lUZVns0RDXid2rrx4BZr0irA2NtO3ScTu1DiceAXK1ZpfNJWOM+SA2aGpRos4q9VRLIp8Rw6op983d+iIih3yXpTLF6mjhZqKpKQtZ7kRBxxZfRVTXnsH3zDGaP8AUhi7NzADOUryLxz4K1gT2jejdq+kl1hldE8PbqXelqX08rZWaR17Qd/3WCuEqKFe9dNVjtR4ApUvaMr5vaBlvGV/hRSFqYJ2TMz2/wAHYvRKSrjqohJHxGsHYfOIxQFWzVXXB0GUKNN0PI3lnhXDwyy3KpIv2WFkrc14uF9VNNFUx+rlFx2c42HzoW6aJpTIrQ+E4PnmDPx8DwX3HHF6ksT7K7ZjaO6cN7hvE5tPiDQ/qr12Vr5Cf/3mljt7asPiJ2m9VRVGTJYzdnxDr6PDqWPrMgzxG8Pxt/3dGvhc7QFch8/JBPvXLraFp0KOJsiMdL8JHUXhdmdqhoq04GxVG4Fps4WKftQ/Ldn9UnWzlvQ7NBcUX4h+Tmh+XFn9UlZurNdHT+1YMAFz4rGn8JNeMmipX6AXGwFyvpjHPOa0XPML9i73ji9SXU7R7RhwWF0ZwbuFJu4NE6lVDtjX8CYgMmfxPuzwtB8LzyVH0/tCJGeXRHucTvM+QFwHAKzp8lyPxk+Edf2448yvqP0fmkIdP8LdnzHw448y9jWbWmJpRstm2GDRt075OdvMsrh1VeRFexxtjaGsFgtfBBHAwRxiwHnidpRc4cMkgAEkkAAVJJuAGZUMYSZBaVqdqx7gCNFaPekUBrYFDM/Mei5VNQ2Bmc7gNpUevrY6SLPfp1DafOk6uhenqn2GNGgyoYrpF5GV2wOA/Wa9z9yEWai8pKlrPcstJI6Rxe7SV57NM+aQyPNyUEu9ejfn5I0WqmhRptX0kvhclOx6mpUe4G89FKIuIFit81FmW308VIEsVeqSzOH1KiIkrW1u+iHb4SQidRh9Tojq4ab8kRCbWzuVG1q1MtExNHG1UllwOc4YFx4eSvJM6Nv8k4d7f/K7QTvhdnMPgVKpKyWlkz4zvGojYfOCwaIwgkEEEGRBEiDmCMlxWxdt6uwdIH+oLMTJ7ZWuAd+IePRZ725qlH0epbbZ+JsyB/cJTHOnFaCmr4prA4O2Hu1d/MtpQ5YgqgG/ldsPcde7A8yr6KXNIvUKcrZc2xCDQkHeKFenA1k0ptBGiEbi5xHIGa8lF8va1+DhfeL9q+JI2SCzwDvF+1WFuuumyl70EcYbPsh1102UvegDgxg+iryLn7NDyG/2jwXH2Km+k3+0eC9LSNYNJffGikHK26XlQLz3PJvM1xRdWtDRZotuXdjGsFmAAcwsOpERcmsJuC/V9AXXFfbRNFfEeGw2klxkABOfrerD2HqXHjEOf/pM+YScR8rb+ZlzWh9kdjwtHZYhtk43vNXO8XeVBRV9TlGKLBvxHqG89ypq7LUFPdrPidsGgbz3DHcvH1X1UZo8nxZOim4Xthzldvdx8t6tI2OM0BlQ4vUqoKYq7s1n5ZXyuznnFYupqZKiQySG57OYbAgFnavmku/0QCVXXeaSz7u7+FzXBC21W6SY+EkInVt3khrhp0RE+G4oo92/f1REUiuK7yTgcPqVUBt0ukotT2OvgiKeAw+p1UOpg55qSZbO/wCqO2LqzRENKtvzzTKfe9ZIRZ2t6S7/AEREEjiv8kbXH9kAtVukjTbvpJEXi9o6r6PGJLodg12mANPAnJ3MKrdoezx85wYrXN+abT5gEHotDDp7PqiEy2fVVKirZ4hZrsOfH79asKfKtXAM1j8NhxHXo4WWPaRqppbL4DncWC0P+M148SGWmTgQReCCCPEFbyTYurNZN7QBLTon9sP9gVxRVzp3lrgBYXw3jxWmyVleSskMb2gWF8L7QNBJ2quoiKyV8vvA0OJEwMcf7Wk/ovV0XVLS3kD3LmjMuFgf8jPorp7NmT0UjdGd+xn2VrBtbO76KnqcpvjkLGtGHnmWYr8uywTPiYwYG1zj4Kg9n+zyoMaKJZiGJ/8AJwkPIq1dndhQIABhQxa/GQHO/NlykvUnLY6+KF1il6rJquaXB7sOgdSoKnKVVUCz3m2wYDoGnjdHUw3+aUlMYvU6IRYreolLb6eKjKCpG84vUqKG1x8slIE9rd9EG3fSSIgriu8kzl3fWaA2tnck+51REJlhu81DqYOeakus0vmhFi6s0RRafx8kT4k7kRFLjboKJOYs5/ZQ6uC/yU0lIYvU6oiAy2cz9UbsX1mg44svoobTHyzRF0+2I5gwYsVsrTWEidRPiFQT7QNInOxC/K7/ACV51kB+Fjzu926X0WLuvVxkyCKRji9oOPctTkGjgnhe6VgJzte5W9/tA0g9yH+V3+Sl/tC0g9yF+V3+SpyKy9ip+QFee66P6YVxPtC0iUrEL8rv8kHtC0iUrEL8rv8AJU5E9ip+QE910f0wriz2haQO5C/K7/JVjtbtB8eKYr5WjKchIUkBIT3BdVF0jp4ozdjQCusNFBCc6NgBtbDZ5siIi7KUvc7E1oi6Mz3bWsItFxtNJM5AZEUk0L1Xe0LSCJWIX5Xf5KnIo76WB7i5zBc6VDfk+lkcXPjBJ04aVcR7QtIlKxC/K7/JGe0PSB3IX5Xf5KnIvn2Kn5AXx7ro/phW9ntA0gdyH+V3+Ske0DSJzsQ/yu/yVPRPYqfkBPddH9MK+9ia5R4+kQ4bmwwHOAMmkGXDaV+dt3Ukse1N/wDmQf7x+q2F1cHPJU2UomRyAMFsO8rLZep4oJmCJoALb4byhNqgySdLGaH5b804d71mq5UaNNmhRosX1mjZd69Q2mPlmiLn8QNxRRaZ6BREUOFnDXqku93t38JKxW+fJRKW308eKIpAnU3+pINrFTdkola2t2Xgpx8Jc0ReZrISdFjg3CG6SxpzDO5bpGhtitMNzQWkVBqCNxC6n9I0bD8PB8fds+ysaKtbTtIIvcq9yVlaOjjcxzSbm+FtnOsVsHclg7ltX9H0ZtPh4J/9bPsn9G0Zt+jwT/sb9lM97s5JVn+JYfpnpCxWwdyWDuW1HsbRhtfDwfCw3Pkg7G0Y7Xw8HwsNy5J73ZySn4lh+mekLFbB3KCFtf8ARtGddo8ES+Rv2WX66wGM0t7YbWtaA2TWiQGyJyA4qTS1zah5aARhfrHip1BleOskMbWkWF8SNoGrevDREU5WykNKmwdy0PUDQIL9HLnwobz7xwBc0EgBjDKZHFWc9i6MNr4eCeFhn2VZNlNkUhYWnDcqKpy9FBK6IsJINtIWK2TuSwdy2odjaNi+Hg+Fhv2Qdi6M6o0eCP8AY37Ln73ZySuH4lh+mekLFbJ3JYO5bV/R9Gddo8Ef+tn2Q9j6MTZ+Hg+Pu2fZPe7OSU/EsP0z0hZdqa0/GQad8fqtgds4a9V0YXZWjscC2BCDhc4MaCJ7qLvYOM+Srq2pFQ8OAtYW61R5Vr21kjXtaRYWx3k6t6ESqL0l3u9u/hJWdq+aiXf6fyoaq1LROrqHyRptYqdEs2q3SSdvhLmiKfdN39UUfD8eiIiAWcVeqS72W7+E/vuSueH1JEQidRcjtrDSXJDww+po75Of0REJnQXpPu57/wCUPy35p+5EQGzQ1KNFnFXqgl3r0b8/JEQCW0bt36IRPaF279UHHD6kh4YfU0RHC1hp0WTe0Az06J/bD/YFrJ+Tmsm9oEvjokvww/2NVpkn9Z37T2haD0b/AKp37D/yaq6iItAtotR9mrgNEdP/AMrv2Q1agJVNyqns1l8K6d3vXS/Iyf0VrHHDl9Fla3+ofvXnmVv62Xeku9lu/hHC1hp0Tww+po6fcuUVVyE2sNOiT7ue/wDlD8l6UyxepoiAyob0GzirPmg44svojfn5IiASqbkl3st38IPmuyT9qIkrVRQITaw06IZ925D8nNEUe5dv6lEm/j0REUg2qGiTns5ITbpdJROex18ERSTLZFyO2bqzQGzs7/qg2OM0RCLNReUlS1nuQCztb0l3+iIjRaqaI02r6SQttVukmPhJEQGezl9kJls5fdJz2evgk5bPXxREJs3Vmsn1/h/9bEocMP8AYFrA2OM18ImhQ52nQ2OJ3sBPmfBS6Op9neXWvcW2ax4KxyZXiilMhbe4I021g9yw6wdxSwdxW4f0+Ff7mHLdYb9lH9PhOr7mGJfI37Kw98N5HX9le/iaP6R/u/8AKr3s2YPhXTyiu/ZD+ytQrsm5fODAaBJjWsF8gAJ+XgvoTa2d30VTPL62Qvta6zVZUe0TulAtnG6Tls5ITZoKqJy2OvipBsUvXJRkcLN1UlIWs0AsVvmosy2+niiKWie0b/sjdq+kklPa3fRDt8JIiDaobgk62ckJtbO5J9zqiITZoEcLN1ZoDZpfNALHGaIo9+dwRT8RwUoi46LeUZj5lEREi4hyU6Vlz+iIiKY+EckGD1vRERNGuPj9Fx0XNEREhYz4lImMckRETSslz0i4eKIiKDg9b1MDCeaIiLjo2fL6qIWI80RER2PyTSb+SIiLlpVwUuwcgiIiiDhPNRo2fJSiIuOj4jz/AFQ4/W5ERE0i8eC5aTkiIi66IiIv/9k="/>
                    </c:if></td>
                    <td>${s.salary}</td>
                    <td>${s.phone}</td>
                    <td style="text-align: center"><input type="button" onclick="doUpdate(${s.id});" value="Update"/></td>
                    <td style="text-align: center"><input type="button" onclick="doDelete(${s.id});" value="Delete"/></td>                  
                </tr>
            </c:forEach>
        </table>
        <a href="insert">insert</a><br>
        <div class="pagger" id="paggerbottom"></div><br>
        
        <a href="${home}">Home</a>
        <script>
            generatePagger('paggerbottom',${requestScope.pageIndex},${requestScope.totalPage},2);
        </script>
    </body>
</html>
