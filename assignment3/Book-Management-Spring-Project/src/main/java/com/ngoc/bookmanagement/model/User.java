package com.ngoc.bookmanagement.model;

import com.ngoc.bookmanagement.service.PasswordService;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;
import java.io.Serializable;

//
@Entity
@Table(name = "user")
public class User implements Serializable {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "email", unique = true)
    @NotBlank(message = "Email isn't blank")
    @Email(message = "Email isn't true")
    @Length(max = 50, message = "Email contains maximum 50 characters")
    private String email;

    @Transient
    @NotBlank(message = "password isn't blank")
    @Length(min = 6, max = 20, message = "Password contains between 6 and 20 characters")
    private String password;

    @Transient
    private String matchingPassword;

    @Transient
    private String rePassword;

    @Column(name = "encryptingPassword")
    private String encryptingPassword;

    @Column(name = "firstName")
    private String firstName;

    @Column(name = "lastName")
    private String lastName;

    @Column(name = "status")
    private Boolean status = true;

    @Column(name = "role")
    private int role;

    @Column(name = "avatar_id")
    private long avatar_id;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "avatar_id", insertable = false, updatable = false, nullable = true)
    private Avatar avatar;

    public User() {
        super();
        this.email = "";
        this.password = "";
        this.matchingPassword = "";
        this.rePassword = "";
        this.firstName = "";
        this.lastName = "";
    }

    public User(String email, String password) {
        super();
        this.email = email;
        this.password = password;
    }

    public User(String email, String password, Boolean status) {
        this.email = email;
        this.password = password;
        this.status = status;
    }

    public User(String email, String password, String firstName, String lastName) {
        super();
        this.email = email;
        this.password = password;
        this.matchingPassword = password;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public User(String email, String password, String firstName, String lastName, int role) {
        super();
        this.email = email;
        this.password = password;
        this.matchingPassword = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.role = role;
    }

    public User(String email, String password, String matchingPassword, String firstName, String lastName) {
        super();
        this.email = email;
        this.password = password;
        this.matchingPassword = matchingPassword;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public User(String password, String matchingPassword, String rePassword) {
        this.password = password;
        this.matchingPassword = matchingPassword;
        this.rePassword = rePassword;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMatchingPassword() {
        return matchingPassword;
    }

    public void setMatchingPassword(String matchingPassword) {
        this.matchingPassword = matchingPassword;
    }

    public String getRePassword() {
        return rePassword;
    }

    public void setRePassword(String rePassword) {
        this.rePassword = rePassword;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getEncryptingPassword() {
        return encryptingPassword;
    }

    public void setEncryptingPassword(String encryptingPassword) {
        this.encryptingPassword = encryptingPassword;
    }

    public long getAvatar_id() {
        return avatar_id;
    }

    public void setAvatar_id(long avatar_id) {
        this.avatar_id = avatar_id;
    }

    public Avatar getAvatar() {
        return avatar;
    }

    public void setAvatar(Avatar avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", status=" + status +
                ", role=" + role +
                '}';
    }
}
