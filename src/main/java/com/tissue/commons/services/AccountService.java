package com.tissue.commons.services;

import com.tissue.core.Account;
import com.tissue.core.dao.AccountDao;
import com.tissue.core.command.UserCommand;
import com.tissue.core.command.VerificationCommand;
import com.tissue.core.command.EmailCommand;
import com.tissue.core.command.PasswordCommand;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;

import java.util.List;
import java.util.Locale;

@Component
public class AccountService {

    @Autowired
    private AccountDao accountDao;

    public String addUser(UserCommand userCommand) {
        return accountDao.create(userCommand);
    }

    public boolean isUsernameExist(String username) {
        return accountDao.isUsernameExist(username);
    }

    public Account getAccount(String accountId) {
        return accountDao.getAccount(accountId);
    }

    public void setVerified(String accountId) {
        accountDao.setVerified(accountId);
    }

    public Account getAccountByEmail(String email) {
        return accountDao.getAccountByEmail(email);
    }

    public boolean isEmailExist(String email) {
        return accountDao.isEmailExist(email);
    }

    public void updateEmail(EmailCommand command) {
        accountDao.updateEmail(command);
    }

    public void updatePassword(PasswordCommand command) {
        accountDao.updatePassword(command);
    }


}
