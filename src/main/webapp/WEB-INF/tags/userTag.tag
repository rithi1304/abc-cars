<%@ attribute name="user" required="true" type="com.Sa.CarSale.entity.User" %>
<c:if test="${not empty user}">
    <li class="profile bg-dark">
        <a href="/profile">
            <img src="images/user_icon.jpg" alt="User Profile">
            ${user.name}
        </a>
    </li>
</c:if>

