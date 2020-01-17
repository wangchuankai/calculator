<template>
	<view class="myindex">
		<view class="uni-center mytitle">请完善如下信息：</view>
		<view class="uni-list">
			<view class="uni-list-cell">
				<view class="uni-list-cell-left">
					我的出生日期：
				</view>
				<view class="uni-list-cell-db">
					<picker mode="date" :value="start_date" :start="startDate"  @change="bindStartDateChange">
						<view class="uni-input">{{start_date}}</view>
					</picker>
				</view>
			</view>
			<view class="uni-list-cell">
				<view class="uni-list-cell-left">
					父亲的出生日期：
				</view>
				<view class="uni-list-cell-db">
					<picker mode="date" :value="end_date" :start="startDate" :end="endDate" @change="bindEndDateChange">
						<view class="uni-input">{{end_date}}</view>
					</picker>
				</view>
			</view>
			<view class="uni-list-cell">
				<view class="uni-list-cell-left">
					母亲的出生日期：
				</view>
				<view class="uni-list-cell-db">
					<picker mode="date" :value="end_date" :start="startDate" :end="endDate" @change="bindEndDateChange">
						<view class="uni-input">{{end_date}}</view>
					</picker>
				</view>
			</view>
			<view class="uni-list-cell">
				<view class="uni-list-cell-left">
					我认为我们的寿命为：
				</view>
				<view class="uni-list-cell-db">
					<input class="uni-input"  placeholder="最大输入" />
				</view>
			</view>
		</view>
		<view class="myprimary">
			<button type="primary" @click="count" :disabled="isDis">计算</button>
		</view>
		<view class="result">
			<view class="mytitle" v-if="showmsg">
				开始时间与结束时间相同无时间间隔
			</view>
			<view class="mytitle" v-if="showmsg1">
				开始时间不可以大于结束时间
			</view>
			<view v-if="!showmsg1 && !showmsg">
				<view v-if="year || month || day">
					<view class="mytitle">
						相隔时间计算结果：
					</view>
					<view class="resNum">
						<text v-if="year">{{year}} 年,</text>
						<text v-if="month">{{month}} 月,</text>
						<text v-if="day">{{day}} 天。</text>
					</view>
					
					<view class="mytitle" v-if="countY || countM || countD">
						分别按照年、月、日合计：
					</view>
					<view class="resNum">
						<text v-if="countY">{{countY}} 年</text>
					</view>
					<view class="resNum">
						<text v-if="countM">{{countM}} 月</text>
					</view>
					<view class="resNum">
						<text v-if="countD">{{countD}} 天</text>
					</view>
					
				</view>
			</view>
		</view>
		<view class="adbanner">
			<!-- <ad unit-id="3bb05f156229fef740d3c963b0b0d538"></ad> -->
		</view>
	</view>
</template>

<script>
	import dayjs from "dayjs";
	var mons = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
	 
	 function isLeapYear(year) {
	   var  r = year / 100
	   if (r === parseInt(r)) {
	     r = year / 400
	     return r === parseInt(r)
	   }
	   r = year / 4
	   if (r === parseInt(r)) {
	     return true
	   }
	   return false
	 }
	  
	 function getDaysOfMonth(month, year) {
	   if (month === 2 && isLeapYear(year)) {
	     return 29
	   }
	   return mons[month]
	 }
	  
	 function mydiff(s1, s2) {
	   var arr1 = s1.split('-').map(Number)
	   var arr2 = s2.split('-').map(Number)
	   var [year, month, day] = arr2.map((n, i) => n - arr1[i]);
	
	   if (day < 0) {
	     day += getDaysOfMonth(arr2[1], arr2[0])
	     month--
	   }
	   if (month < 0) {
	     month += 12 
	     year--
	   }
	   return [year, month, day];
	 }
	export default {
		data() {
			const currentDate = this.getDate({
				format: true
			})
			return {
				start_date: "",
				end_date: currentDate ,
				isDis:true,
				year:'',
				month:'',
				day:'',
				countY:"",
				countM:"",
				countD:"",
				showmsg:false,
				showmsg1:false,
			}
		},
		computed: {
			startDate() {
				return this.getDate('start');
			},
			endDate() {
				return this.getDate('end');
			}
		},
		methods: {
			count(){
				if(this.start_date === this.end_date){
					this.showmsg = true;
					this.showmsg1=false;
				}else{
					this.showmsg = false;
					if((new Date(this.end_date)-new Date(this.start_date)) <0){
						this.showmsg1=true;
					}else{
						this.showmsg1=false;
					}
					
				}
				let date = mydiff(this.start_date, this.end_date);
				this.year=date[0];
				this.month=date[1];
				this.day=date[2];
				const date2 = dayjs(this.start_date)
				const date1 = dayjs(this.end_date)
				this.countY = date1.diff(date2, 'year',true)
				this.countM = date1.diff(date2, 'month',true)
				this.countD = date1.diff(date2, 'day')
			},
				
			bindStartDateChange: function(e) {
				
				this.start_date = e.target.value;
				this.isDis=false;
			},
			bindEndDateChange: function(e) {
				this.end_date = e.target.value;
			},
			getDate(type) {
				const date = new Date();
				let year = date.getFullYear();
				let month = date.getMonth() + 1;
				let day = date.getDate();

				if (type === 'start') {
					year = year - 100;
				} else if (type === 'end') {
					year = year + 100;
				}
				month = month > 9 ? month : '0' + month;
				day = day > 9 ? day : '0' + day;
				return `${year}-${month}-${day}`;
			}
		},
		onShow() {
			uni.showShareMenu({
				withShareTicket:true,
				title:"时间计算器",
				content:"计算时间间隔、计算年龄，快来使用吧",
				path:"pages/index/index",
				success(res){
					console.log(res);
				}
			})
		}
	}
</script>

<style>
	.myindex{
		position: relative;
		height: 98vh;
	}
.mytitle {
		margin: 20upx;
}
.myprimary{
	padding-top: 40upx;
}
.resNum{
	padding-left: 20upx;
}
	
.adbanner{
	position: absolute;
	width: 100%;
	height: 200upx;
	bottom: 0;
}
</style>
