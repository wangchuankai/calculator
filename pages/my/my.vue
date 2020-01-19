<template>
	<view class="myindex">
		<view class="uni-center mytitle">请完善如下信息：</view>
		<view class="uni-list">
			<view class="uni-list-cell">
				<view class="uni-list-cell-left">
					我的出生日期(必填)：
				</view>
				<view class="uni-list-cell-db">
					<picker mode="date" :value="my_date" :start="startDate" placeholder="请输入"  @change="bindMyDateChange">
						<view class="uni-input">{{my_date}}</view>
					</picker>
				</view>
			</view>
			<view class="uni-list-cell">
				<view class="uni-list-cell-left">
					父亲的出生日期：
				</view>
				<view class="uni-list-cell-db">
					<picker mode="date" :value="father_date" :start="startDate" :end="endDate" @change="bindFatherDateChange">
						<view class="uni-input">{{father_date}}</view>
					</picker>
				</view>
			</view>
			<view class="uni-list-cell">
				<view class="uni-list-cell-left">
					母亲的出生日期：
				</view>
				<view class="uni-list-cell-db">
					<picker mode="date" :value="mother_date" :start="startDate" :end="endDate" @change="bindmotherDateChange">
						<view class="uni-input">{{mother_date}}</view>
					</picker>
				</view>
			</view>
			<view class="uni-list-cell">
				<view class="uni-list-cell-left">
					我期望能活到的年龄（周岁）(必填)：
				</view>
				<view class="uni-list-cell-db">
					<input class="uni-input" 	type="number" :value="age" @input="bindAgeChange"  placeholder="请输入正整数" />
				</view>
			</view>
		</view>
		<view class="myprimary">
			<button type="primary" @click="count" :disabled="isDis">保存</button>
			<!-- <button type="default" class="normalbtn" @click="addClick">不要点击这个按钮</button> -->
		</view>
		<!-- <view class="adbanner">
			<ad unit-id="3bb05f156229fef740d3c963b0b0d538"></ad>
		</view> -->
	</view>
</template>

<script>
	import dayjs from "dayjs";
	export default {
		data() {
			const currentDate = this.getDate({
				format: true
			})
			return {
				my_date: "",
				father_date: "" ,
				mother_date: "" ,
				age:'',
				isDis:true,
				info:{
					my:{
						total:0,
						use:''
					},
					father:{
						total:0,
						use:''
					},
					mother:{
						total:0,
						use:''
					},
				},
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
			// addClick(){
			// 	var videoAd = qq.createRewardedVideoAd({              adUnitId: "d94113774bb178db9455e159ecfd94fe"})
			// 	videoAd.onError(function(res){              console.log('videoAd onError',res)})            
			// 	videoAd.onLoad(function(res){              console.log('videoAd onLoad',res)})            
			// 	videoAd.onClose(function(res){              console.log('videoAd onClose',res)})                        
			// 	videoAd.load().then(() => {                console.log('激励视频加载成功');                
			// 	videoAd.show().then(() => {                  console.log('激励视频 广告显示成功')})                
			// 	.catch(err => {                  console.log('激励视频 广告显示失败')})})              
			// 	.catch(err => {                console.log('激励视频加载失败')})    
			// },
			getIsDis(){
				if(this.my_date &&  this.age ){
					return false;
				}else{
					return true;
				}
			},
			count(){
				if((this.mother_date || this.father_date) && (this.my_date <= this.father_date || this.my_date <= this.mother_date)){
					uni.showToast({
						icon:"none",
						title: "我的出生日期不能早于父母或者相同",
						mask:true,
						duration:2000
					})
					return;
				}
				if(this.age>150){
					uni.showToast({
						icon:"none",
						title: "年龄最多不可超过150岁",
						mask:true,
						duration:2000
					})
					return;
				}
				
				
				
				const date2 = dayjs(this.my_date);
				const date1 = dayjs(new Date());
				let useMonth = parseInt(date1.diff(date2, 'month',true));
				let totalMoth = this.age *12;
				if(this.father_date){
					let usefatherMonth = parseInt(date1.diff(dayjs(this.father_date), 'month',true));
					if(totalMoth < usefatherMonth  ){
						uni.showToast({
							icon:"none",
							title: "期望年龄不可小于父亲当前年龄",
							mask:true,
							duration:3000
						})
						return;
					}
				}
				if(this.mother_date){
					let usemotherMonth = parseInt(date1.diff(dayjs(this.mother_date), 'month',true));
					if(totalMoth < usemotherMonth  ){
						uni.showToast({
							icon:"none",
							title: "期望年龄不可小于母亲当前年龄",
							mask:true,
							duration:3000
						})
						return;
					}
				}
				
				if(totalMoth < useMonth  ){
					uni.showToast({
						icon:"none",
						title: "期望年龄不可小于父母当前年龄",
						mask:true,
						duration:3000
					})
					return;
				}
				this.info.my={
					total:totalMoth,
					use:useMonth
				};
				if(this.father_date){
					const date2 = dayjs(this.father_date);
					const date1 = dayjs(new Date());
					let useMonth = parseInt(date1.diff(date2, 'month',true));
					let totalMoth = this.age *12;
					this.info.father={
						total:totalMoth,
						use:useMonth
					};
				};
				if(this.mother_date){
					const date2 = dayjs(this.mother_date);
					const date1 = dayjs(new Date());
					let useMonth = parseInt(date1.diff(date2, 'month',true));
					let totalMoth = this.age *12;
					this.info.mother={
						total:totalMoth,
						use:useMonth
					};
				};
				
				uni.setStorageSync('my_date',this.my_date)
				uni.setStorageSync('father_date',this.father_date)
				uni.setStorageSync('mother_date',this.mother_date)
				uni.setStorageSync('age',this.age)
				
				uni.setStorageSync('info',this.info)
				uni.showToast({
					title:"保存成功,即将跳转人生进度页面",
					icon:"none",
					mask:true,
					duration:2000
				});
				uni.switchTab({
					url:"../battery/battery"
				})
			},
				
			bindMyDateChange: function(e) {
				this.my_date = e.target.value;
				this.isDis = this.getIsDis();
				console.log(this.isDis);
			},
			bindFatherDateChange: function(e) {
				this.father_date = e.target.value;
			},
			bindmotherDateChange: function(e) {
				this.mother_date = e.target.value;
			},
			bindAgeChange(e){
				this.age = e.target.value;
				this.isDis = this.getIsDis();
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
			this.info = uni.getStorageSync("info");
			console.log(this.info);
			if(this.info && this.info.my && this.info.my.total){
				this.my_date=uni.getStorageSync('my_date');
				this.father_date=uni.getStorageSync('father_date');
				this.mother_date=uni.getStorageSync('mother_date');
				this.age=uni.getStorageSync('age');
				this.isDis=false;
			}else{
				this.info={
					my:{
						total:0,
						use:''
					},
					father:{
						total:0,
						use:''
					},
					mother:{
						total:0,
						use:''
					}
				}
			};
			uni.showShareMenu({
				withShareTicket:true,
				title:"时间计算器",
				content:"计算时间间隔、计算年龄，查看人生进度，快来使用吧",
				path:"pages/index/index",
				success(res){
					console.log(res);
				}
			});
			console.log(getApp().globalData);      
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
	

.normalbtn{
	border: #ccc 1px solid;
	margin-top: 16px;
	font-size: 16px;
}
.normalbtn{
	border: #ccc 1px solid;
	margin-top: 16px;
	font-size: 16px;
}
.adbanner{
	position: absolute;
	width: 100%;
	height: 200upx;
	bottom: 0;
}
</style>
