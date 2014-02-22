<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ISP Boxplot</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/highcharts-more.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
</head>
<body>
<div id="container" style="height: 400px; margin: auto; min-width: 310px; max-width: 600px"></div>

<script>
$(function () {
    $('#container').highcharts({

      chart: {
          type: 'boxplot'
      },

      title: {
          text: 'Highcharts Box Plot Example'
      },

      legend: {
          enabled: false
      },

      xAxis: {
          categories: ['1', '2', '3', '4', '5'],
          title: {
              text: 'Experiment No.'
          }
      },

      yAxis: {
          title: {
              text: 'Observations'
          },
          plotLines: [{
              value: 932,
              color: 'red',
              width: 1,
              label: {
                  text: 'Theoretical mean: 932',
                  align: 'center',
                  style: {
                      color: 'gray'
                  }
              }
          }]
      },

      series: [{
          name: 'Observations',
          data: [
              [760, 801, 848, 895, 965],
              [733, 853, 939, 980, 1080],
              [714, 762, 817, 870, 918],
              [724, 802, 806, 871, 950],
              [834, 836, 864, 882, 910]
          ],
          tooltip: {
              headerFormat: '<em>Experiment No {point.key}</em><br/>'
          }
      }, {
          name: 'Outlier',
          color: Highcharts.getOptions().colors[0],
          type: 'scatter',
          data: [ // x, y positions where 0 is the first category
              [0, 644],
              [4, 718],
              [4, 951],
              [4, 969]
          ],
          marker: {
              fillColor: 'white',
              lineWidth: 1,
              lineColor: Highcharts.getOptions().colors[0]
          },
          tooltip: {
              pointFormat: 'Observation: {point.y}'
          }
      }]

  });
});
</script>
</body>
</html>
