Feature: Failed exercise in Online training.
As a manager
In order to monitor the performance of exercises.
I want to open other exercises only after the completed exercise.

Scenario 1: The consumer who bought the training did not complete the exercise on time
Given previously, the consumer always performed exercises on time
And he had no questions about passing the exercise.
When he doesn't do the exercise on time
Then I have a chance to write to him with a question.
