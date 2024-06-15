<p align="center">
  <img src="https://github.com/MobvenTeam1/FitAI-iOS/assets/142516106/afdebaa6-530f-4cbc-9980-a68391848da2" alt="FitAI App Icon" width="150" height="150">
</p>
<div align="center">
  <h1>FitAI - Mobven Final Project by Ahmet Yasin Atakan - Elif Tüm</h1>
</div>

## Screen Record
https://youtu.be/soxWkuOhErw

## Features
**Register:**
- User can be registered with their name, surname, username, e-mail, password and password confirmation.
- When the user clicks sign-up, the system checks if the email is already in use.
- Users must meet certain requirements when setting a password to be able to register.
- If all the requirements are met, user is registered and we direct the user to the personal info questions.
<p align="left">
  <img src="https://github.com/MobvenTeam1/FitAI-iOS/assets/142516106/4a87fc70-3019-460b-9375-14f26f6d9ef8" alt="Register Screen" width="200" height="400">
</p>


**Personal Info Questions:**
- We ask the user for their gender, height, current weight, target weight, and date of birth.
- We also allow the user to select their goals from multiple options: lose weight, gain weight, build muscle, and live a healthy life.
- After the user answers all the questions, we save their responses in our database to suggest a more accurate training program.
- If there are no issues (e.g., server error), we direct them to our login screen.
- 
<p align="left">
  <img src="https://github.com/MobvenTeam1/FitAI-iOS/assets/142516106/bcacb75d-5a31-4014-bf77-ba13bd4e2658" alt="Personal Info" width="200" height="400">
</p>

**Login Screen:**
- The user can log in with the email and password they created.
- If the email cannot be found in our database, we alert the user that no such email exists.
- If the user forgets their password, we allow them to reset it using their phone number and email.
- If the email and password are correct, we direct them to our homepage.

<p align="left">
  <img src="https://github.com/MobvenTeam1/FitAI-iOS/assets/142516106/3f937dd9-20d9-4df4-84af-5542d9ac7453" alt="Login Screen" width="200" height="400">
</p>

**Home Page:**

*Add Exercise Button:*
- Users can search for and add daily exercises to their routine, or calculate how many calories they burn by entering the duration of the exercise.

*Add Food Button:*
- Users can search for and add the food they eat in a day and calculate how many calories they consume.

*Daily Progress:*
- User can track their daily progress.
- The progress bar shows the percentage of their daily calorie goal they have met.
- Calories Consumed: After the user adds what they eat in a day using the "Add Food" button, the total calorie intake is shown here.
- Calories Spent: After the user adds daily exercises using the "Add Exercise" button, the total calories burned are shown here. Additionally, based on the user's responses after the registration screen, we calculate their basal metabolism rate.
- Daily Target: Based on the user's responses after the registration screen, we calculate the daily calorie target.

*Personalized Training Program:*
- After the user taps the button, we ask them questions such as known health problems, preferred sports activities, sports frequency, and body parts to focus on.
- When the user answers all the questions, we post their answers to our database and create a personalized training program powered by Artificial Intelligence.
- 
  <p align="left">
  <img src="https://github.com/MobvenTeam1/FitAI-iOS/assets/142516106/7705993a-3c65-4211-9491-22a0bed3c992" alt="AI Training" width="200" height="400">
</p>

*Personalized Nutrition Program:* (Phase 2)
- For the phase 1, we provide our users with a standard healthy meal plan. For example, for breakfast: boiled egg, avocado, cheese, tomato, and brown bread.
- If users want to change a specific food item, they can simply tap the button next to the food name and choose an alternative food with similar calories.
- For phase 2, we plan to provide our users with a nutrition program powered by AI.
- For phase 2, we will ask our users questions to provide the most accurate nutrition plan. The questions include: known health problems, food allergies, and the type of diet they want to follow.

**Tab Bar:**
- User can navigate between homepage, progress(phase 2), add button, discover (phase 2) and profile.

*Add Button:*
- If the user wants to add personalized training program, personalized nutrition program and water consumption tracking (phase 2), they can use this button.

*Profile:*
- In phase 1, everything is in the user interface except for the logout functionality.
- For phase 2, we plan to add more functionality to our profile screen.
 <p align="left">
  <img src="https://github.com/MobvenTeam1/FitAI-iOS/assets/142516106/6e0029ad-76c1-4c6f-8453-3bd9b02ed35a" alt="Profile" width="200" height="400">
</p>
