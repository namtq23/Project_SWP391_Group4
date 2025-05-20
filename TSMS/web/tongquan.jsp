


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>KiotViet Dashboard</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f7fa;
      margin: 0;
      padding: 0;
    }

    .top-toolbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: white;
      border-bottom: 1px solid #ccc;
      padding: 5px 20px;
      font-size: 14px;
    }

    .toolbar-right {
      display: flex;
      align-items: center;
      flex-wrap: wrap;
    }

    .toolbar-right button {
      margin-left: 10px;
      cursor: pointer;
      background: none;
      border: none;
      font-size: 14px;
      background-color: #eee;
      padding: 5px 10px;
      border-radius: 5px;
    }

    header {
      background-color: #007bff;
      color: white;
      padding: 15px;
      text-align: center;
      font-size: 22px;
    }

    
    
    nav {
      background-color: #007bff;
      padding: 10px;
      display: flex;

    }

    
    
    
    .nav-btn {
      background: none;
      border: none;
      color: white;
      font-size: 16px;
      cursor: pointer;
      padding: 8px 12px;
      border-radius: 5px;
      transition: background-color 0.3s;
    }

    .nav-btn:hover {
      background-color: rgba(255, 255, 255, 0.2);
    }

    .main {
      display: flex;
      padding: 20px;
       max-width: 1200px;
         margin: 0 auto;
    }

    .container {
      flex: 3;
      padding-right: 20px;
        max-width: 900px; 
    }

    .sidebar-right {
      flex: 1;
      background-color: white;
      padding: 15px;
      border-radius: 10px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      max-height: 70vh;
      overflow-y: auto;
    }
        .sidebar-right1 {
      flex: 1;
/*      background-color: white;*/
      padding: 15px;
      border-radius: 10px;
/*      box-shadow: 0 2px 5px rgba(0,0,0,0.1);*/
      max-height: 90vh;
      overflow-y: auto;
    }
        .sidebar-right2 {
      flex: 1;
      background-color: white;
      padding: 15px;
      border-radius: 10px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      max-height: 70vh;
      overflow-y: auto;
    }


    .cards {
      display: flex;
      justify-content: space-between;
      margin-bottom: 20px;
    }

    .card {
      background-color: white;
      padding: 20px;
      border-radius: 10px;
      width: 24%;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      text-align: center;
    }

.chart-container {
  background-color: white;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  margin-bottom: 20px;
  max-width: 100%; /* Đảm bảo không vượt quá khung */
}



    .flex-box {
      display: flex;
      justify-content: space-between;
    }

    .list-box {
      background-color: white;
      padding: 15px;
      border-radius: 10px;
      width: 48%;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    h3 {
      margin-bottom: 10px;
    }

    ul {
      padding-left: 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    .notification {
      margin-bottom: 15px;
    }

    .activity {
      margin-bottom: 10px;
      font-size: 14px;
    }

    .activity strong {
      color: #007bff;
    }

    .activity small {
      display: block;
      color: #777;
      font-size: 12px;
    }

    .ad-banner img {
      width: 100%;
      border-radius: 10px;
      margin-bottom: 15px;
    }
    
    
    
    .sidebar-right h3 {
  font-size: 18px;
  margin-bottom: 10px;
}

.sidebar-right table {
  width: 100%;
  border-collapse: collapse;
}

.sidebar-right table img {
  width: 100%;
  border-radius: 10px;
  margin-bottom: 10px;
}

.sidebar-right table tr {
  margin-bottom: 15px;
}

.dropdown-panel {
  display: none;
  position: absolute;
  background-color: white;
  color: black;
  min-width: 180px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.15);
  z-index: 999;
  padding: 10px;
  border-radius: 6px;
  margin-top: 40px;
}

.dropdown-panel a {
  display: block;
  padding: 8px 10px;
  text-decoration: none;
  color: #333;
}

.dropdown-panel a:hover {
  background-color: #f1f1f1;
}



.menu {
  list-style: none;
  display: flex;
  background: #007bff;
}

.menu-item {
  position: relative;
  padding: 15px;
  color: white;
  cursor: pointer;
}

.submenu {
  display: none;
  position: absolute;
  background: white;
  top: 100%;
  left: 0;
  list-style: none;
  padding: 10px 0;
  box-shadow: 0 2px 5px rgba(0,0,0,0.2);
  min-width: 150px;
  z-index: 100;
}

.menu-item:hover .submenu {
  display: block;
}

.submenu li {
  padding: 10px 20px;
  color: black;
  white-space: nowrap;
}


    
  </style>
</head>             
<body>

<!-- Toolbar -->
<div class="top-toolbar">
  <div class="toolbar-left">
    <strong>SWP391</strong>
  </div>
  <div class="toolbar-right">
<!--    <button>🚚 Giao hàng</button>
    <button>💰 Vay vốn</button>
    <button>💳 Thanh toán</button>
    <button>💡 Nguồn hàng giá tốt</button>
    <button>🎨 Chủ đề</button>
    <button>💬 Hỗ trợ</button>
    <button>📝 Góp ý</button>
    <button>🖥️ Giao diện cũ</button>-->
    <button>🇻🇳 Tiếng Việt</button>
    <button>📧</button>
    <button>⚙️</button>
    <button>👤</button>
  </div>
</div>



<nav>
    


  <button onclick="openLinkInNewTab('http://localhost:9999/TSMS/tongquan.jsp')" class="nav-btn" id="tong-quan-btn">Tổng quan</button>
  
  
  
  
  
<button onclick="toggleDetails1()" class="nav-btn" id="hang-hoa-btn">Hàng Hóa</button>
  <div id="hang-hoa-panel" class="dropdown-panel">
    <a href="#">Danh mục</a>
    <a href="#">Thiết lập giá</a>
    <a href="#">Phiếu bảo hành</a>
    <a href="#">Kiểm kho</a>
  </div>

<<<<<<< Updated upstream:TSMS/web/tongquan.jsp
<button class="nav-btn" id="cai-dat-btn">Đơn hàng</button>

<button class="nav-btn" id="bao-cao-btn">Nhân viên</button>

<button class="nav-btn" id="cai-dat-btn">Phân tích</button>
=======
<!--<div class="nav-btn" id="hang-hoa">
  Hàng Hóa
  <div id="hang-hoa-panel" class="dropdown-panel" position: absolute;">
     Nội dung menu con ở đây 
    <div>Đặt hàng</div>
    <div>Hóa đơn</div>
    <div>Vận đơn</div>
  </div>
</div>
-->




<button onclick="toggleDetails2()" class="nav-btn" id="giao-dich-btn">Giao dịch</button>
  <div id="giao-dich-panel" class="dropdown-panel">
    <a href="#">Đặt hàng</a>
    <a href="#">Hóa đơn</a>
    <a href="#">Vận đơn</a>
    <a href="#">Trả hàng</a>
    <a href="#">Trả hàng</a>
    <a href="#">Yêu cầu sửa chữa</a>
    <a href="#">Trả hàng nhập</a>
    <a href="#">Xuất Hủy</a>    
  </div>
<button onclick="toggleDetails3()" class="nav-btn" id="doi-tac-btn">Đối tác</button>
  <div id="doi-tac-panel" class="dropdown-panel">
    <a href="#">Khách hàng</a>
    <a href="#">Nhà cung cấp</a>
    <a href="#">Đối tác giao hàng</a>

  </div>



<button onclick="toggleDetails4()" class="nav-btn" id="nhan-vien-btn">Nhân viên</button>
  <div id="nhan-vien-panel" class="dropdown-panel">
    <a href="#">Nhân viên</a>
    <a href="#">Lịch làm việc</a>
    <a href="#">Chấm công</a>
    <a href="#">Bảng tính lươn</a>
    <a href="#">Thiết lập hoa hồng</a>
    <a href="#">Thiết lập nhân viên</a>

  </div>


<button onclick="toggleDetails5()" class="nav-btn" id="so-quy-btn">Sổ quỹ</button>



<button onclick="toggleDetails6()" class="nav-btn" id="bao-cao-btn">Báo cáo</button>

 <div id="bao-cao-panel" class="dropdown-panel" position: absolute;>
    <a href="#">Cuối ngày</a>
    <a href="#">Bán hàng</a>
    <a href="#">Đặt hàng </a>
    <a href="#">Hàng hóa</a>
    <a href="#">Khách hàng</a>
    <a href="#">Nhà cung cấp</a>
    <a href="#">Nhân viên</a>
    <a href="#">Kênh bán hàng</a>
    <a href="#">Tài chính</a>

  </div>
>>>>>>> Stashed changes:TSMS/web/WEB-INF/jsp/admin/tongquan.jsp



</nav>


<!-- Main Content -->
<div class="main">
  <div class="container">
    <!-- Thống kê -->
    <div class="cards">
      <div class="card">
        <strong>Doanh thu</strong>
        <div>0</div>
      </div>
      <div class="card">
        <strong>Trả hàng</strong>
        <div>0</div>
      </div>
      <div class="card">
        <strong>So với hôm qua</strong>
        <div>0</div>
      </div>
      <div class="card">
        <strong>Doanh thu thuần</strong>
        <div style="color: red;">-5.72%</div>
      </div>
    </div>

    <!-- Biểu đồ doanh thu -->
    <div class="chart-container">
      <h3>Doanh thu thuần (Tháng trước)</h3>
      <canvas id="revenueChart" width="700" height="300"></canvas>
    </div>



<!--
 Biểu đồ top sản phẩm chia 2 phần 
-->

<div class="flex-box">
  <div class="chart-container" style="width: 49%;">
    <h3>TOP 5 HÀNG BÁN CHẠY NHẤT</h3>
    <canvas id="topProductChart1" height="300"></canvas>
  </div>
  <div class="chart-container" style="width: 49%;">
    <h3>TOP 5 HÀNG BÁN CHẠY TIẾP THEO</h3>
    <canvas id="topProductChart2" height="300"></canvas>
  </div>
</div>


    <!-- Danh sách top -->
    <div class="flex-box">
      <div class="list-box">
        <h3>Top 10 hàng bán chạy</h3>
        <ul>
          <li>Micro không dây Zenbos MZ-201 - 50.1 triệu</li>
          <li>...</li>
        </ul>
      </div>


      <div class="list-box">
        <h3>Top 10 khách mua nhiều nhất</h3>
        <ul>
          <li>Mr Hoàng - Sài Gòn - 58.2 triệu</li>
          <li>...</li>
        </ul>
      </div>
    </div>
  </div>




<div class="sidebar-right1">


<div class="sidebar-right">

  <!-- BẢNG QUẢNG CÁO -->
  <div class="section-box" style="margin-bottom: 30px ">
    <h3>BẢNG QUẢNG CÁO</h3>
    <table style="width: 100%;">
      <tr>
        <td><img src="https://via.placeholder.com/300x100" alt="Quảng cáo 1" style="width: 100%;"></td>
      </tr>
      <tr>
        <td><img src="https://via.placeholder.com/300x100" alt="Quảng cáo 2" style="width: 100%;"></td>
      </tr>
    </table>
  </div>
  </div>
  
<div class="sidebar-right2">
  <!-- THÔNG BÁO -->
  <div class="section-box" style="margin-bottom: 30px;"> 
    <h3>THÔNG BÁO</h3>
   <table style="width: 100%;"> 
      <tr style="background-color: #fff3f3;">
        <td style="color: red; padding: 10px; border-radius: 10px; overflow: hidden; ">
          🔴 Có <strong>1 hoạt động đăng nhập khác thường</strong> cần kiểm tra.
          <br>
          <button onclick="toggleDetails()" style="margin-top: 8px; padding: 5px 10px;">Hiển thị thêm</button>
          <div id="login-details" style="display: none; margin-top: 10px; color: black;">
            <div><strong>0559049285</strong> đã đăng nhập trên <strong>Máy tính Windows</strong></div>
            <div>Thời gian: <strong>15/05/2025 14:08</strong></div>
            <div><a href="#" style="color: blue;">Kiểm tra</a></div>
          </div>
        </td>
      </tr>
    </table>
  </div>

  <!-- HOẠT ĐỘNG GẦN ĐÂY -->
  <div class="section-box">
    <h3>CÁC HOẠT ĐỘNG GẦN ĐÂY</h3>
    <table style="width: 100%;">
      <tr>
        <td style="width: 30px;">📦</td>
        <td><strong>Phượng Nguyễn</strong> vừa nhập hàng<br><small>Giá trị: 0 - 2 ngày trước</small></td>
      </tr>
      <tr>
        <td>📦</td>
        <td><strong>Hoàng Nam Quang</strong> bán đơn giao hàng<br><small>15,000,000 - 2 ngày trước</small></td>
      </tr>
      <tr>
        <td>🔄</td>
        <td><strong>Phượng Nguyễn</strong> kiểm hàng<br><small>2 ngày trước</small></td>
      </tr>
      <tr>
        <td>📦</td>
        <td><strong>Phượng Nguyễn</strong> bán đơn hàng<br><small>6,760,000 - 3 ngày trước</small></td>
      </tr>
    </table>
  </div>

  </div>

  </div>




<!-- Toggle JS -->


<script>
  function toggleDetails() {
    const details = document.getElementById('login-details');
    details.style.display = (details.style.display === 'none') ? 'block' : 'none';
  }
</script>

<script>
function openLinkInNewTab(url) {
  window.open(url, '_blank');
}

</script>



<script>
  function toggleDetails1() {
    const panel = document.getElementById('hang-hoa-panel');
    panel.style.display = (panel.style.display === 'block') ? 'none' : 'block';
  }

  // Ẩn bảng chọn nếu click ra ngoài
  window.addEventListener('click', function(event) {
    const panel = document.getElementById('hang-hoa');
    const button = document.querySelector('.nav-btn');
    if (!panel.contains(event.target) && event.target !== button) {
      panel.style.display = 'none';
    }
  });
</script>




<script>
  function toggleDetails2() {
    const panel = document.getElementById('giao-dich-panel');
    panel.style.display = (panel.style.display === 'block') ? 'none' : 'block';
  }

  // Ẩn bảng chọn nếu click ra ngoài
  window.addEventListener('click', function(event) {
    const panel = document.getElementById('giao-dich');
    const button = document.querySelector('.nav-btn');
    if (!panel.contains(event.target) && event.target !== button) {
      panel.style.display = 'none';
    }
  });
</script>

<script>
  function toggleDetails3() {
    const panel = document.getElementById('doi-tac-panel');
    panel.style.display = (panel.style.display === 'block') ? 'none' : 'block';
  }

  // Ẩn bảng chọn nếu click ra ngoài
  window.addEventListener('click', function(event) {
    const panel = document.getElementById('doi-tac');
    const button = document.querySelector('.nav-btn');
    if (!panel.contains(event.target) && event.target !== button) {
      panel.style.display = 'none';
    }
  });
</script>

<script>
  function toggleDetails4() {
    const panel = document.getElementById('nhan-vien-panel');
    panel.style.display = (panel.style.display === 'block') ? 'none' : 'block';
  }

  // Ẩn bảng chọn nếu click ra ngoài
  window.addEventListener('click', function(event) {
    const panel = document.getElementById('doi-tac');
    const button = document.querySelector('.nav-btn');
    if (!panel.contains(event.target) && event.target !== button) {
      panel.style.display = 'none';
    }
  });
</script>

<script>
  function toggleDetails5() {
    const panel = document.getElementById('hang-hoa-panel');
    panel.style.display = (panel.style.display === 'block') ? 'none' : 'block';
  }

  // Ẩn bảng chọn nếu click ra ngoài
  window.addEventListener('click', function(event) {
    const panel = document.getElementById('hang-hoa-');
    const button = document.querySelector('.nav-btn');
    if (!panel.contains(event.target) && event.target !== button) {
      panel.style.display = 'none';
    }
  });
</script>

<script>
  function toggleDetails6() {
    const panel = document.getElementById('bao-cao-panel');
    panel.style.display = (panel.style.display === 'block') ? 'none' : 'block';
  }

  // Ẩn bảng chọn nếu click ra ngoài
//  window.addEventListener('click', function(event) {
//    const panel = document.getElementById('bao-cao-');
//    const button = document.querySelector('.nav-btn');
////    if (!panel.contains(event.target) && event.target !== button) {
////      panel.style.display = 'none';
////    }
    
  window.addEventListener('click', function(event) {
   // const panel = document.getElementById('bao-cao-panel');
    const button = document.querySelector('.nav-btn');

    // Nếu bảng đang hiển thị
    if (panel.style.display === 'block') {
      // Kiểm tra nếu click KHÔNG nằm trong bảng và KHÔNG phải là nút
      if (!panel.contains(event.target) && !button.contains(event.target)) {
        panel.style.display = 'none'; // Ẩn bảng
      }
    }




  });
</script>


    


<!-- Chart.js scripts -->
<script>
  const ctx1 = document.getElementById('revenueChart').getContext('2d');
  new Chart(ctx1, {
    type: 'bar',
    data: {
      labels: [...Array(30).keys()].map(i => (i+1).toString().padStart(2, '0')),
      datasets: [{
        label: 'Doanh thu (triệu)',
        data: [24, 8, 21, 22, 9, 24, 5, 11, 7, 28, 10, 9, 8, 24, 20, 13, 18, 14, 6, 7, 22, 22, 19, 17, 14, 26, 9, 10, 25, 21],
        backgroundColor: '#007bff'
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true,
          ticks: {
            callback: value => value + ' tr'
          }
        }
      }
    }
  });


  const ctx2 = document.getElementById('topProductChart').getContext('2d');
  new Chart(ctx2, {
    type: 'bar',
    data: {
      labels: [
        "Dell Inspiron 15 3520 i5 1235U", "MacBook Pro M2", "Lenovo ThinkPad X1",
        "HP Envy 13", "Acer Aspire 7", "Asus Zenbook UX425",
        "MSI GF63", "Huawei MateBook D15", "Gigabyte G5", "LG Gram 16"
      ],
      datasets: [{
        label: "Doanh thu (tỷ)",
        data: [2.15, 1.85, 1.65, 1.5, 1.3, 1.25, 1.1, 1.0, 0.95, 0.85],
        backgroundColor: '#007bff'
      }]
    },
    options: {
      indexAxis: 'y',
      scales: {
        x: {
          beginAtZero: true,
          ticks: {
            callback: value => value + ' tỷ'
          }
        }
      }
    }
  });
</script>

</body>
</html>
