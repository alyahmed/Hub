/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.site.controller;

import ca.ahmedaly.site.UserService;
import org.hamcrest.Matchers;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 *
 * @author ahmedaly
 */
@RunWith(MockitoJUnitRunner.class)
public class SignUpControllerTest {

    private MockMvc mockMvc;

    private UserService userService;

    @Before
    public void setUp() {
        userService = Mockito.mock(UserService.class);
        Mockito.reset(userService);
        mockMvc = MockMvcBuilders.standaloneSetup(new SignUpController(userService)).build();
    }

    @Test
    public void getSignUpForm_shouldAddNewSignUpFormToViewModel() throws Exception {
        mockMvc.perform(get("/signup"))
                .andExpect(status().isOk())
                .andExpect(view().name("/signUpForm"))
                .andExpect(model().attribute("signUpForm", Matchers.hasProperty("username")))
                .andDo(MockMvcResultHandlers.print());
    }
    

}
