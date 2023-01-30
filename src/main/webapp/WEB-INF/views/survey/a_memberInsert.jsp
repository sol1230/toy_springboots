<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />

<div class="container">
<c:set var="form_action" value="update" />
<c:if test="${empty resultMap}">
	<c:set var="form_action" value="insert" />
</c:if>

<form action="/member/photoInsert" method="post" enctype="multipart/form-data">

<div class="form-group form-row">
	<label class="form-label">File Upload</label>
	<input type="file" name="file_first" class="form-control"> 
</div>
<div class="form-group form-row">
	<div class="col">
	<label>아이디</label> <input class="form-control" type="text"
			name="USER_ID" value="${resultMap.USER_ID}" placeholder="아이디"
			required ${form_action == "update" ? "readonly" : ""} />
		<div class="invalid-tooltip">
			
		</div>
	</div>
</div>
<div class="form-group form-row">
	<div class="col">
	<label>비밀번호</label> <input class="form-control" type="text"
			name="PASSWORD" value="${resultMap.PASSWORD}" placeholder="아이디"
			required ${form_action == "update" ? "readonly" : ""} />
		<div class="invalid-tooltip">
			
		</div>
	</div>
</div>
<div class="form-group form-row">
	<div class="col">
		<label>이름 </label> <input class="form-control" type="text"
			name="NAME" value="${resultMap.NAME}" placeholder="이름" required ${statusDisabled}/>
		<div class="invalid-tooltip">
			
		</div>
	</div>
</div>
<div class="form-group form-row">
	<div class="col">
		<label>생년월일 </label> <input class="form-control" type="text"
			name="BIRTH_DATE" value="${resultMap.BIRTH_DATE}" placeholder="생년월일" required ${statusDisabled}/>
		<div class="invalid-tooltip">
			
		</div>
	</div>
</div>
<div class="form-group form-row">
	<div class="col">
		<label>전화번호 </label> <input class="form-control" type="text"
			name="PHONE" value="${resultMap.PHONE}" placeholder="전화번호" required ${statusDisabled}/>
		<div class="invalid-tooltip">
			
		</div>
	</div>
</div>

<div class="row justify-content-between">
	<div class="col">
			<button class="btn btn-primary"
				>
				${form_action}
			</button>
		<button class="btn btn-outline-info"
			>
			List
		</button>
	</div>

	<div class="col text-right">
	</div>
</div>
</form>
</div>
