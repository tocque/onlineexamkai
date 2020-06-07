<template>

  <div class="login-container" :class="systemLogin ? 'system-login' : ''">
    <el-form v-if="systemLogin" ref="systemLoginForm" :model="systemLoginForm" :rules="loginRules" class="login-form" autocomplete="on" label-position="left">

      <div class="title-container">
        <h3 class="title" :class="systemLogin ? 'system-login' : ''">在线考试系统 后台登录</h3>
      </div>

      <el-form-item prop="username">
        <span class="svg-container">
          <svg-icon icon-class="user"></svg-icon>
        </span>
        <el-input
          ref="username"
          v-model="systemLoginForm.username"
          placeholder="用户名"
          name="username"
          type="text"
          tabindex="1"
          autocomplete="on"
        ></el-input>
      </el-form-item>

      <el-tooltip v-model="capsTooltip" content="Caps lock is On" placement="right" manual>
        <el-form-item prop="password">
          <span class="svg-container">
            <svg-icon icon-class="password"></svg-icon>
          </span>
          <el-input
            :key="passwordType"
            ref="password"
            v-model="systemLoginForm.password"
            :type="passwordType"
            placeholder="密码"
            name="password"
            tabindex="2"
            autocomplete="on"
            @keyup.native="checkCapslock"
            @blur="capsTooltip = false"
            @keyup.enter.native="handleLogin"
          ></el-input>
          <span class="show-pwd" @click="showPwd">
            <svg-icon :icon-class="passwordType === 'password' ? 'eye' : 'eye-open'"></svg-icon>
          </span>
        </el-form-item>
      </el-tooltip>

      <el-form-item prop="captcha">
        <span class="svg-container">
          <svg-icon icon-class="user"></svg-icon>
        </span>
        <el-input
          ref="captcha"
          class="captcha-box"
          v-model="systemLoginForm.captcha"
          placeholder="请输入验证码"
          name="captcha"
          type="text"
          tabindex="1"
          autocomplete="on"
        ></el-input>
        <img id="captcha-img" title="点击切换验证码" style="cursor:pointer;"
              :src="'../system/get_captcha?vl=4&w=150&h=40&type=loginCaptcha'+timestamp" width="110px" height="30px"
              @click="timestamp = '&t='+new Date().getTime()">
      </el-form-item>
      <el-form-item prop="role">
        <span class="svg-container">
          <svg-icon icon-class="user"></svg-icon>
        </span>
        <el-radio v-model="systemLoginForm.role" label="教师">教师</el-radio>
        <el-radio v-model="systemLoginForm.role" label="管理员">管理员</el-radio>
      </el-form-item>
      <el-button :loading="loading" type="primary" style="width:100%;margin-bottom:30px;" @click.native.prevent="handleSystemLogin">登录</el-button>

      <div style="position:relative; display: flex">
        <!-- <el-link class="reg" type="primary" @click="login = false">注册</el-link> -->
        <el-link class="reg" type="primary" @click="systemLogin = false">学生登录</el-link>
      </div>
    </el-form>

    <el-form v-else-if="login" ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form" autocomplete="on" label-position="left">

      <div class="title-container">
        <h3 class="title">在线考试系统</h3>
      </div>

      <el-form-item prop="username">
        <span class="svg-container">
          <svg-icon icon-class="user"></svg-icon>
        </span>
        <el-input
          ref="username"
          v-model="loginForm.username"
          placeholder="Username"
          name="username"
          type="text"
          tabindex="1"
          autocomplete="on"
        />
      </el-form-item>

      <el-tooltip v-model="capsTooltip" content="Caps lock is On" placement="right" manual>
        <el-form-item prop="password">
          <span class="svg-container">
            <svg-icon icon-class="password" />
          </span>
          <el-input
            :key="passwordType"
            ref="password"
            v-model="loginForm.password"
            :type="passwordType"
            placeholder="Password"
            name="password"
            tabindex="2"
            autocomplete="on"
            @keyup.native="checkCapslock"
            @blur="capsTooltip = false"
            @keyup.enter.native="handleLogin"
          ></el-input>
          <span class="show-pwd" @click="showPwd">
            <svg-icon :icon-class="passwordType === 'password' ? 'eye' : 'eye-open'"></svg-icon>
          </span>
        </el-form-item>
      </el-tooltip>

      <el-button :loading="loading" type="primary" style="width:100%;margin-bottom:30px;" @click.native.prevent="handleLogin">登录</el-button>

      <div style="position:relative; display: flex">
        <el-link class="reg" type="primary" @click="login = false">注册</el-link>
        <el-link type="primary" @click="systemLogin = true">登录后台</el-link>
      </div>
    </el-form>

    <el-form v-else ref="registerForm" :model="registerForm" :rules="registerRules" class="login-form" autocomplete="on" label-position="left">

      <div class="title-container">
        <h3 class="title">在线考试系统</h3>
      </div>

      <el-form-item prop="username">
        <span class="svg-container">
          <svg-icon icon-class="user"></svg-icon>
        </span>
        <el-input
          ref="username"
          v-model="registerForm.username"
          placeholder="请输入用户名"
          name="username"
          type="text"
          tabindex="1"
          autocomplete="on"
        />
      </el-form-item>

      <el-tooltip v-model="capsTooltip" content="Caps lock is On" placement="right" manual>
        <el-form-item prop="password">
          <span class="svg-container">
            <svg-icon icon-class="password"></svg-icon>
          </span>
          <el-input
            :key="passwordType"
            ref="password"
            v-model="registerForm.password"
            :type="passwordType"
            placeholder="密码不少于6位"
            name="password"
            tabindex="2"
            autocomplete="on"
            @keyup.native="checkCapslock"
            @blur="capsTooltip = false"
            @keyup.enter.native="handleLogin"
          />
          <span class="show-pwd" @click="showPwd">
            <svg-icon :icon-class="passwordType === 'password' ? 'eye' : 'eye-open'" />
          </span>
        </el-form-item>
      </el-tooltip>

        <el-form-item prop="checkPass">
            <span class="svg-container">
            <svg-icon icon-class="password" />
            </span>
            <el-input
            :key="passwordType"
            ref="checkPass"
            v-model="registerForm.checkPass"
            :type="passwordType"
            placeholder="确认密码"
            name="checkPass"
            tabindex="2"
            autocomplete="on"
            />
            <span class="show-pwd" @click="showPwd">
            <svg-icon :icon-class="passwordType === 'password' ? 'eye' : 'eye-open'" />
            </span>
        </el-form-item>

      <el-form-item prop="trueName">
        <span class="svg-container">
          <svg-icon icon-class="people" />
        </span>
        <el-input
          ref="trueName"
          v-model="registerForm.trueName"
          placeholder="输入真实姓名(选填)"
          name="trueName"
          type="text"
          tabindex="1"
          autocomplete="on"
        />
      </el-form-item>

      <el-form-item prop="subjectId">
        <span class="svg-container">
          <svg-icon icon-class="user" />
        </span>
        <el-select
            style="width: 90%"
          ref="subjectId"
          v-model="registerForm.subjectId"
          placeholder="选择所属专业"
          name="subjectId"
          type="text"
          tabindex="1"
          autocomplete="on"
        >
            <el-option v-for="subject of subjects" :label="subject.name" :value="subject.id" :key="subject.id"></el-option>
        </el-select>
      </el-form-item>

      <el-form-item prop="tel">
        <span class="svg-container">
          <svg-icon icon-class="user" />
        </span>
        <el-input
          ref="tel"
          v-model="loginForm.tel"
          placeholder="请输入手机号(选填)"
          name="tel"
          type="text"
          tabindex="1"
          autocomplete="on"
        />
      </el-form-item>

      <el-button :loading="loading" type="primary" style="width:100%;margin-bottom:30px;" @click.native.prevent="handleRegister">注册</el-button>

      <div style="position:relative; display: flex">
        <el-link class="reg" type="primary" @click="login = true">登录</el-link>
      </div>
    </el-form>
  </div>
</template>

<script>
import { validUsername } from '../utils/validate.js'
import { toForm } from '../utils/shim.js'

export default {
    name: 'Login',
    data() {
        const validateUsername = (rule, value, callback) => {
            if (!validUsername(value)) {
                callback(new Error('用户名中不能包含特殊字符'))
            } else {
                callback()
            }
        }
        const validatePassword = (rule, value, callback) => {
            if (value.length < 6) {
                callback(new Error('密码不少于6位'))
            } else {
                callback()
            }
        }
        return {
          role: "管理员",
            timestamp: '',
            systemLogin: false,
            systemLoginForm: {
                username: '',
                password: '',
                captcha: '',
            },
            systemLoginRules: {
                username: [{ required: true, trigger: 'blur', validator: validateUsername }],
                password: [{ required: true, trigger: 'blur', validator: validatePassword }],
                password: [{ required: true, trigger: 'blur' }],
            },
            loginForm: {
                username: '',
                password: ''
            },
            loginRules: {
                username: [{ required: true, trigger: 'blur', validator: validateUsername }],
                password: [{ required: true, trigger: 'blur', validator: validatePassword }]
            },
            registerForm: {
                username: '',
                password: '',
                checkPass: '',
                trueName: '',
                subjectId: '',
                tel: '',
            },
            registerRules: {
                username: [{ required: true, trigger: 'blur', validator: validateUsername }],
                password: [{ required: true, trigger: 'blur', validator: validatePassword }],
                checkPass: [{ required: true, trigger: 'blur', validator: (rule, value, callback) => {
                    if (value === this.registerForm.password) callback();
                    else callback(new Error('两次输入的密码不一致'));
                }}],
                subjectId: [{ required: true, trigger: 'blur' }],
            },
            passwordType: 'password',
            capsTooltip: false,
            loading: false,
            showDialog: false,
            redirect: undefined,
            otherQuery: {},
            login: true,
            subjects: [],
        }
    },
    created() {
        axios.get("register").then(({data}) => {
            this.subjects = this.subjects.concat(eval(data));
        })
        // window.addEventListener('storage', this.afterQRScan)
    },
    mounted() {
        if (this.loginForm.username === '') {
        this.$refs.username.focus()
        } else if (this.loginForm.password === '') {
        this.$refs.password.focus()
        }
    },
    destroyed() {
        // window.removeEventListener('storage', this.afterQRScan)
    },
    methods: {
        checkCapslock(e) {
            const { key } = e
            this.capsTooltip = key && key.length === 1 && (key >= 'A' && key <= 'Z')
        },
        showPwd() {
            if (this.passwordType === 'password') {
                this.passwordType = ''
            } else {
                this.passwordType = 'password'
            }
            this.$nextTick(() => {
                this.$refs.password.focus()
            })
        },
        handleLogin() {
            this.$refs.loginForm.validate(valid => {
                if (valid) {
                this.loading = true;
                const { username: name, password } = this.loginForm;
                axios.post("login", toForm({ name, password }))
                    .then(({ data }) => {
                        if (data.type == 'success') {
                            window.location.href = "user/index";
                        } else {
                            this.loading = false;
                            this.$notify.error(data.msg);
                        }
                    })
                    .catch((e) => {
                        this.loading = false;
                        this.$notify.error('系统忙，请稍后再试');
                    })
                } else {
                    console.log('error submit!!')
                    return false
                }
            })
        },
        handleSystemLogin() {
            this.$refs.systemLoginForm.validate(valid => {
                if (valid) {
                this.loading = true;
                const { username, password, captcha } = this.systemLoginForm;
                axios.post("../system/login", toForm({ username, password, captcha }))
                    .then(({ data }) => {
                        if (data.type == 'success') {
                            window.location.href = "../system/index";
                        } else {
                            this.loading = false;
                            this.timestamp = '&t='+new Date().getTime()
                            this.$notify.error(data.msg);
                        }
                    })
                    .catch((e) => {
                        this.loading = false;
                        this.timestamp = '&t='+new Date().getTime()
                        this.$notify.error('系统忙，请稍后再试');
                    })
                } else {
                    console.log('error submit!!')
                    return false
                }
            })
        },
        getOtherQuery(query) {
            return Object.keys(query).reduce((acc, cur) => {
                if (cur !== 'redirect') {
                acc[cur] = query[cur]
                }
                return acc
            }, {})
        },
        handleRegister() {
            this.$refs.registerForm.validate(valid => {
                if (valid) {
                    this.loading = true;
                    const { username: name, password, subjectId, trueName } = this.registerForm;
                    axios.post("register", toForm({ name, password, subjectId, trueName, t: Math.random() }))
                        .then(({ data }) => {
                            if (data.type == 'success') {
                                this.$notify.success("注册成功！进入用户主页");
                                setTimeout(() => {
                                    axios.post("login", toForm({ name, password }))
                                        .then(({ data }) => {
                                            if (data.type == 'success') {
                                                window.location = "user/index";
                                            } else {
                                                this.loading = false;
                                                this.$notify.error(data.msg);
                                            }
                                        })
                                        .catch((e) => {
                                            this.loading = false;
                                            this.$notify.error('系统忙，请稍后再试');
                                        })
                                }, 3000);
                            } else {
                                this.loading = false;
                                this.$notify.error(data.msg);
                            }
                        })
                        .catch((e) => {
                            this.$notify.error('系统忙，请稍后再试');
                        })
                } else {
                    console.log('error submit!!')
                    return false
                }
            })
        }
    }
}
</script>

<style>
.reg {
    margin-left: auto;
    margin-right: 10px;
}
.login-container, .title {
  transition: 1s;
}
.login-container.system-login {
  background: antiquewhite;
}
.title.system-login {
  color: black !important;
}
.system-login input {
  color: black !important;
  caret-color: black !important;
}
.system-login input::-webkit-input-placeholder {
  color: #444 !important;
}
.captcha-box {
  width: 60% !important;
}
#captcha-img {
  position: relative;
  top: 10px;
}
</style>