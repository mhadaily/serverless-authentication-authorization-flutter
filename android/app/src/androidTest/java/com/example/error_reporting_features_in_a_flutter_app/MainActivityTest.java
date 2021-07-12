package com.example.mjcoffee;

import androidx.test.rule.ActivityTestRule;
import dev.flutter.plugins.integration_test.FlutterTestRunner;
import org.junit.Rule;
import org.junit.runner.RunWith;

// import MainActivity from our main app
import com.example.mjcoffee.MainActivity;

@RunWith(FlutterTestRunner.class)
public class MainActivityTest {
  @Rule
  public ActivityTestRule<MainActivity> rule = 
  new ActivityTestRule<>(MainActivity.class, true, false);
}








