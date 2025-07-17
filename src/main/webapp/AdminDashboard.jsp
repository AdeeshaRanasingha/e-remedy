<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="shortcut icon" href="img/favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .dashboard {
            display: flex;
            min-height: 100vh;
            background-color: #f3f4f6;
        }
        .left-panel {
            width: 280px;
            background-color: #1e3a8a;
            padding: 1.5rem;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            position: fixed;
            height: 100%;
        }
        .sidebar {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }
        
		.btn {
		    display: inline-block;
		    background-color: rgb(151, 43, 33);
		    color: #ffffff;
		    padding: 12px 30px;
		    text-decoration: none;
		    border: none;
		    border-radius: 2px;
		    font-family: 'Montserrat', sans-serif;
		    font-size: 14px;
		    letter-spacing: 1px;
		    text-transform: uppercase;
		    transition: all 0.3s ease;
		    font-weight: 600;
		}
		
	   .btn:hover {
		    background-color: #000000;
		    color: #ffffff;
		    transform: translateY(-3px);
		    box-shadow: 0 5px 15px rgba(212, 175, 55, 0.3);
		}
        .profile-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin: 0 auto;
            border: 2px solid #e5e7eb;
        }
        .field {
            display: flex;
            justify-content: space-between;
            padding: 0.5rem 0;
            border-bottom: 1px solid #4b5e9e;
        }
        .field label {
            font-weight: 600;
            color: #e5e7eb;
        }
        .field .value {
            color: #d1d5db;
        }
        .edit-btn {
            width: 100%;
            background-color: #3b82f6;
            color: white;
            padding: 0.75rem;
            border-radius: 0.375rem;
            border: none;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        .edit-btn:hover {
            background-color: #2563eb;
        }
        .middle-panel {
            margin-left: 280px;
            padding: 2rem;
            flex: 1;
        }
        .cards-container {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
            width: 100%;
        }
        .actions, .notifications {
            background-color: #ffffff;
            padding: 1.5rem;
            border-radius: 0.375rem;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            flex: 1;
            min-width: 0;
        }
        .action-btn {
            display: block;
            width: 100%;
            background-color: #3b82f6;
            color: white;
            padding: 0.75rem;
            text-align: center;
            border-radius: 0.375rem;
            transition: background-color 0.2s, transform 0.2s;
        }
        .action-btn:hover {
            background-color: #2563eb;
            transform: translateY(-2px);
        }
        .notifications ul li {
            padding: 0.5rem 0;
            color: #374151;
            border-left: 3px solid #3b82f6;
            padding-left: 1rem;
            margin-bottom: 0.5rem;
        }
        .calendar-section {
            background-color: #ffffff;
            padding: 1.5rem;
            border-radius: 0.375rem;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
        }
        h2, h3 {
            color: #1f2937;
        }
        .sidebar h2 {
            color: #e5e7eb;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <!-- LEFT PANEL -->
        <div class="left-panel">
            <c:forEach var="ad" items="${adDetails}">
                <div class="sidebar">
                    <h2 class="text-xl font-bold text-center">Hello, ${ad.name}!</h2>
                    <img class="profile-icon" src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Supplier Profile">
                    <div class="field"><label>Supplier ID</label><div class="value">${ad.supId}</div></div>
                    <div class="field"><label>Name</label><div class="value">${ad.name}</div></div>
                    <div class="field"><label>Address</label><div class="value">${ad.address}</div></div>
                    <div class="field"><label>Phone</label><div class="value">${ad.phone}</div></div>
                    <div class="field"><label>Email</label><div class="value">${ad.email}</div></div>
                    <div class="field"><label>Username</label><div class="value">${ad.userName}</div></div>
                    <div class="field"><label>Password</label><div class="value">${ad.password}</div></div>
                    
                    <a href="login.jsp" class="btn">Logout</a>
                </div>
                
            </c:forEach>
        </div>

        <!-- MIDDLE PANEL -->
        <div class="middle-panel">
            <h2 class="text-2xl font-bold mb-6">Admin Dashboard</h2>
            <div class="cards-container">
                <div class="actions">
                    <h3 class="text-lg font-semibold mb-4">Actions</h3>
                    <ul class="space-y-3">
                        <li><a href="AdminServlet" class="action-btn">Manage Event Planners</a></li>
                        <li><a href="#" class="action-btn">Manage Feedback</a></li>
                        <li><a href="#" class="action-btn">Manage Admins</a></li>
                    </ul>
                </div>
                <div class="notifications">
                    <h3 class="text-lg font-semibold mb-4">Notifications</h3>
                    <ul>
                        <li>New user registered</li>
                        <li>Event planner updated</li>
                    </ul>
                </div>
            </div>

            <!-- CALENDAR -->
            <div class="calendar-section">
                <h3 class="text-lg font-semibold mb-4">Calendar</h3>
                <div id='calendar'></div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                height: 200,
                contentHeight: 'auto',
                events: [
                    { title: 'Team Meeting', start: '2025-05-12' },
                    { title: 'Event Review', start: '2025-05-15' }
                ]
            });
            calendar.render();
        });
    </script>
</body>
</html>