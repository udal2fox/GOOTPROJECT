<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/favicon_rainbow.jpg" type="image/x-icon">
<title>Rainbow BirthDay</title>
</head>
<body>

	<!-- SIDEBAR 페이지 공통내용 -->

	<jsp:include page="sidebar.jsp"></jsp:include>


	<!-- 페이지별 개별 내용 소스코드-->

	<div class="container">
		<section class="m-5">

			<article>
				<div>
					<div aria-label="pagination">
						<ul class="pagination d-flex justify-content-end fw-semibold">
							<li class="page-item"><a class="page-link" href="#" id="lastMonth">지난달</a></li>
							<li class="page-item"><a class="page-link" href="#" id="thisMonth">2024년 03월</a></li>
							<li class="page-item"><a class="page-link" href="#" id="nextMonth">다음달</a></li>
						</ul>
					</div>
				</div>
			</article>

			<article class="mt-5">
				<div class="row row-cols-1 row-cols-md-5 g-4">
					<div class="col">
						<div class="card"
							style="background-color: #FF5798; color: #150070;">
							<div class="card-body">
								<h5 class="card-title fw-semibold"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAADm0lEQVR4nO1Zy27TQBS1gC5gx2vD4zNA5T8QIPgQHmseXSNUhPiDIlhAxbaCmZgWSjuTuiltF3k58R0/SqPWhbIZdJ1UTSaOYteOk6q50pWiJM6cM3PnPk40bWxjG1tim5mRp/MUbnEKTziF95yKVUZhixP4hx68psLAzxgRjzmBSSnlKW3YtvLFvM4oTHECJqdCxnFGoMopvODz7rXMgS99rV9mVLxhROzHBd5NROxzAtOFBfNiJuA5gfuMCC8p8BAiLqPW3YEBX1yUE4yIt70ArOhCbrItWVlvSKu0I23Tl259L3B8je9VNhpyk2/JFd3uTYaI13Nz8kzK4GvnGIXPYQuuLjiyutGQbt2XnrUXyfG7SHR1welBAmZxzZTAy4kw8PmcLcu/toMdjgq8m8ieLK1tS54LORECs6mcRFjYGPN2EBJHBa66Vd6VxnzIaRCYTgQ+T+GB+qNr3x1pV6OHS1S3TT/4bXW9ZWLfORJ4TGucCkfdeVwobfDeAYmqL41vdld2WpyrXYpNAPN8x27k0g2bXg6l3eB+dZCg8CoWeKyOapHCCzto8F7LS2u/FQLi77LuXo2x+zClpsok2SauuzU/CNfO+wDPI4HHJqvZpxw+jHk+K/Bey8vrDTUjmdg09iXQ7CrbK6wdq0ildgp1X+aVir2sWzf7Emi2xIcPYXuQNXiv5bi2kpEeRSAgPrQ/hCV/WAQqShgxAu+iEDDaH8K0NiwCVnFHPYF8XwJqqzzIwuX1ccf01crsRCHQkf9da3gE3LrfVQ9OBAHvWIcQVy5xFv2Pl+YlbskiI5FGy2oapTATv5DxYRYyr3MKJOJhfwIEJke1lVjK1W9Ea+YoVDrCaASaOUZFObKaFyhmI9ZOMyKeRQLfa6BB9SArAsVCwoEmIEFgumukLA5npOQEXmpxzdArFzgV9igM9YWj6qYsZ90LlVUGQMI2fVn4EaIN5cRtLYmhVhkqbKUYTlBCYStUnYsfOqrhHKoOOQd3AtUDzBhJsk0RL2yYtEjFp9REXhRaUasMWSTYOczZscTdmh88Y4TtetM/6nrlrJam4W50Zab2Mq/bh/J6sSWvW03HrhLfQ9DYHqgVlithk7q83m6oVaqSYypOhEh8YeOkWJT7sMAkBc6o+IO7nifb57WsDasjKmZq7xQReJkR8fQnda5owzZsslB0Qt0GpQ8cPHCyw3ak5R6jguNn2BJjVzkSf7OObWza8bf/MWm21QAqLmQAAAAASUVORK5CYII=">  발송 대상자</h5>
								<h4 class="card-text fw-bold text-end" id="numOfRecipients">									
									<span>명</span>
								</h4>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card"
							style="background-color: #FF83D9; color: #150070;">
							<div class="card-body">
								<h5 class="card-title fw-semibold"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAAElUlEQVR4nO2ZXWyTVRjH3ygY9c6vG4FpNGDi7li26M0SnaMXxEQTZ4xGjYnhAtnCh9HFG1RUpuLHFsWMwgaJW1zfydQNQrdqlXP6AorsfUu3iVy0W7v2nLcdsLACGuQxp+1C34/u/Vx70yf532xZ+v+dPud5nvOM46pRjWo4Dp8Pbg1j8riEyTsSJt9LmE6ImFyQEPl3S40Xtq7tudG+vu/arqbB2T0tI/69mwKvB3cGV3CVjrO/JdaImHRIiCQkTEFPm1ft09WO2kPXP3lm+ER326/1ZTd+5njyPhHTbhHRf0oZNwJYVGuNF3Zv/CHS0za6tizmJUReFBGdMzJuFmBzQVvX9d7oetn/5bIZP30aVoqIeksZPStQOC9egJlz85CKXQY5kYVM8gr4PGPQ3zQKBxqPQGfDELxX2w+tNftLgnRsHJrofTV4u8vmZ+8UMTmqZ3ziVBrif89DJpmFudQVjXhPQKOB5lHoahiCHQ/16kK8/wRPu7cH73XJPKzUMx8OyTD916XcKesZXwpgUb4NY/B53SBsWe3VhXDlm9BLm8hJOZcmSxk3A8AX1NN4FLY/2KOBYJfbkfkwJi+pzU/9ngY5rp8udgF4TwC+ffIYvPXwQQ1E1yv+L2yZnzyVuEfCNK0+eXY5zZq3AsAziCY/bFN9E6w67Xvj+DrLAKzOK04/ZD5t7ALwuXQ6Aq1rlHfi46d/DFsyL53MrFY3KXZhrZq3A8B7ArBnPa9sdg/sB2/bL3UWTp90qEulUbVxE2CgeVSTSp8+OyyYMg8At4iIxIsBWJ23Y94uAO8JQGf9YQXAm7WHru9sidxmCJCfKos7rFyySS0nwHfNY9Cm6thfb/r5NUOA/Eh8E4CNB3bNOwHgPQF499E+BcBnLSPHTADQw8UAbLapFEBnw5ACYNdTg3EzAJFiABJbqBjAgcYRBUB7Xf9VQwD1qGy1cbkJ0NfkVwBse+Tgf2YAFPU/k6ocwMCGMU0/KDuAE2WSWcUcJmJ6rewp5ETphBKAzWaWL7Gd+cctpaKXld8AosYzUWEt4loZdaLpc/OqFCI+641MctbInOi8OKd8BSL6tjEAIo+5OUrYVSaZhbAgKwDOhJL15oY5TGYUaeRgmHMvfeg082YIUEij3W6N07ZOfzabe/2pLvCHpsyXetDEpuw9aOwoOnlRU//Hhcwq0wA5CET2ap6U0eUvqSS2kFvZKD4bkS7OakSEmbslTGWnj3orkuNZiJzQpE6GLRg4OyGGUi/orlWWAUJOZGHyj7R2bRmiz3FOQkL0G93FlovpRGILmktrO3X0/nmhfuQs3onY1MVcxXBSbaLswqpzPq/hYBBWuLbclRAZ0fmQ3Mmxmm2l2THj7G8ieqee10+CMHMH52aw09BUpuI2L8g31+vRwno9lRebKtnPmGk2Hqg7rKRKG9dOXi/Gkfy8euXoihClji+slRIrYvIVazBOjYuYXmWnHkaX7uLKHaw7Sph8pJ6dTBqfFhH94E+cvp+rdLAha1xINYiItouI8OzhwV52bBwpaE7EVGK/YyMxmypND2bVqEY1uKXif1ZqOCIJL55qAAAAAElFTkSuQmCC">  카드 미발송</h5>
								<h4 class="card-text fw-bold text-end" id="notSentCount">
									<span>명</span>
								</h4>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card"
							style="background-color: #F2AFFF; color: #150070;">
							<div class="card-body">
								<h5 class="card-title fw-semibold"><img width="48" height="48" src="https://img.icons8.com/color/48/50-percents--v1.png" alt="50-percents--v1"/>  선물 선택 중</h5>
								<h4 class="card-text fw-bold text-end" id="selectingCount">
									<span>명</span>
								</h4>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card"
							style="background-color: #DCD9FF; color: #150070;">
							<div class="card-body">
								<h5 class="card-title fw-semibold"><img width="48" height="48" src="https://img.icons8.com/color/48/75-percents--v1.png" alt="75-percents--v1"/>  선물 선택 완료</h5>
								<h4 class="card-text fw-bold text-end" id="selectedCount">
									<span>명</span>
								</h4>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card"
							style="background-color: #A3A2FD; color: #150070;">
							<div class="card-body">
								<h5 class="card-title fw-semibold"><img width="48" height="48" src="https://img.icons8.com/color/48/100-percents--v1.png" alt="100-percents--v1"/>  선물 발송 완료</h5>
								<h4 class="card-text fw-bold text-end" id="sentCount">
									<span>명</span>
								</h4>
							</div>
						</div>
					</div>
				</div>
			</article>

			<article class="mt-5">
				<div class="overflow-auto" style="height: 450px;">
					<table class="table table-sm table-bordered" id="member_table">
						<thead class="table-danger">
							<tr class="text-center">
								<th>No.</th>
								<th>이름</th>
								<th>직급</th>
								<th>연락처</th>
								<th>이메일</th>
								<th>생년월일</th>
								<th>상태</th>
								<th>선택금액</th>
								<th>수동발송</th>
							</tr>
						</thead>
						<tbody id="recipientList">
							<tr class="text-center align-middle">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><a type="button" class="btn btn-danger">취소</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</article>

		</section>
	</div>
	
	<!-- SIDEBAR 닫힌태그 -->
	</main>
	</div>
	
</body>
<script src="/resources/js/userAdminPage/manage_recipients.js"></script>
</html>