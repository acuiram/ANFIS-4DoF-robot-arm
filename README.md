# ANFIS-4DoF-robot-arm

In ANFIS, the number of hidden nodes in neural networks is as well as in a fuzzy system which consists of fuzzification (layer-1), fuzzy inference system (layer-2 and layer-3), defuzzification (layer-4) and aggregation (layer-5). 

For the 4DoF case, there will be 4 ANFIS networks, one for each theta parameter(theta1, theta2, theta3, theta4) as follows:
- The first ANFIS network will be trained with X and Y coordinates as input and corresponding theta1 values as output. The matrix data1 contains the x-y-theta1 dataset required to train the first ANFIS network(data1 will be used as the train)
- The second ANFIS network will be trained with X and Y coordinates as input and corresponding theta2 values as output. The matrix data2 contains the x-y-theta2 dataset(data2 will be used as the train)
- The third ANFIS network will be trained with X and Y coordinates as input and corresponding theta3 values as output. The matrix data3 contains the x-y-theta3 dataset(data3 will be used as the train)
- The fourth ANFIS network will be trained with X and Y coordinates as input and corresponding theta4 values as output. The matrix data4 contains the x-y-theta4 dataset(data4 will be used as the train)

<br>Angles and leghts:
| theta1     | theta2 | theta3 | theta4 |
| ---      | ---       | ---      | ---       |
| -2pi:2pi     | 0:pi/2    | -pi/4:pi/4 | -pi/2:pi/2 |

| l1     | l2 | l3 | l4 |
| ---      | ---       | ---      | ---       |
| 105 cm     | 55.95 cm    | 69.07 cm | 14.36 cm |


<br>The resulting robot working space for the validation set:
<br>![ANFIS_NAO_4DOF](https://user-images.githubusercontent.com/106117736/209584470-18234aa8-0017-4576-a2c7-bd1deff756ba.jpg)
