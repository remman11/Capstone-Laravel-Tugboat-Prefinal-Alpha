$(document).ready(function(){
  $('#dashboardMenu').addClass("active");
  var ctx = document.getElementById("myChart").getContext('2d');
  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
      datasets: [{
        label: 'MT Energy Sun',
        data: [460, 458, 330, 502, 430, 610, 488],
        borderWidth: 2,
        borderColor: 'rgb(87,75,144)',
        borderWidth: 2.5,
        pointBackgroundColor: '#ffffff',
        pointRadius: 4
      },
      {
        label: 'MT Energy Star',
        data: [1000, 200, 300, 200, 150, 25, 700],
        borderWidth: 2,
        borderColor: 'rgb(61, 199, 190)',
        borderWidth: 2.5,
        pointBackgroundColor: '#ffffff',
        pointRadius: 4
      }]
    },
    options: {
      legend: {
        display: true
      },
      responsive: true,
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true,
            stepSize: 150
          }
        }],
        xAxes: [{
          gridLines: {
            display: false
          }
        }]
      },
    }
  });
});