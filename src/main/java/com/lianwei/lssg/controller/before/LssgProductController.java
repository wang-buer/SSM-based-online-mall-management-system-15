package com.lianwei.lssg.controller.before;


import com.github.pagehelper.PageInfo;
import com.lianwei.lssg.entity.CountEntity;
import com.lianwei.lssg.entity.LssgProduct;
import com.lianwei.lssg.entity.LssgProductClass;
import com.lianwei.lssg.service.before.LssgProductClassService;
import com.lianwei.lssg.service.before.LssgProductService;
import com.lianwei.lssg.utils.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;


@Controller
@RequestMapping("LssgProduct")
public class LssgProductController {

    @Resource
    private LssgProductClassService lssgProductClassService;

    @RequestMapping("/toAdd")
    public String toAdd(){
        return "suffixViews/product/product-add";
    }

    @RequestMapping("/toUpdate")
    public String toUpate(){
        return "suffixViews/product/product-update";
    }

    @Resource
    private LssgProductService impl;

    @RequestMapping("/findByPage")
    @ResponseBody
    public Map findByPage(@RequestBody(required = true) Map map, @RequestParam("query") String query) {
        map.put("query",query);
        List<LssgProduct> list = this.impl.query(map);
        Map map1 = new HashMap();
        map1.put("count", impl.querySize(map));
        map1.put("data", list);
        map1.put("code", 0);
        map1.put("msg", "");
        return map1;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(@RequestBody int productId) {
        System.out.println("传入的ID是:" + productId);
        int result = this.impl.deleteByPrimaryKey(productId);
        return result;
    }

    @RequestMapping("/deletes")
    @ResponseBody
    public  int  batchDelete(@RequestBody Integer[] productIds){
        return   impl.batchDelete(productIds);
    }


    @RequestMapping("/findOne")
    @ResponseBody
    public Object getMe(@RequestBody Integer proudctId) {
        System.out.println("传入的ID是:" + proudctId);
        Object result = this.impl.selectByPrimaryKey(proudctId);
        return result;
    }

    @RequestMapping("/update")
    @ResponseBody
    public int edit(@RequestBody LssgProduct lssgProduct) {
        int result = this.impl.updateByPrimaryKeySelective(lssgProduct);
        return result;
    }

    @RequestMapping("/add")
    @ResponseBody
    public int add(@RequestBody LssgProduct lssgProduct) {//接受json 需要加@RequestBody
        int result = this.impl.insertSelective(lssgProduct);
        return result;
    }




    @RequestMapping("/addPath")
    @ResponseBody
    public Map addPath(HttpServletRequest request,MultipartFile file
    ) throws IOException {
        // 图片新名字
        String name = UUID.randomUUID().toString();
        // 图片原名字
        String oldName = file.getOriginalFilename();
        // 后缀名
        String exeName = oldName.substring(oldName.lastIndexOf("."));
        //上传路径

        String path = request.getSession().getServletContext().getRealPath("uploadfiles/productImg");
        System.out.println("文件上传路径是："+path);
        File uploadfiles = new File(path);
        if (!uploadfiles.exists()){
            uploadfiles.mkdir();
        }
        File pic = new File(uploadfiles +"\\"+ name + exeName);
        // 保存图片到本地磁盘
        file.transferTo(pic);
        Map map=new HashMap();
        map.put("path1", name + exeName);
        return map;
    }
    
    /**
     * 
     * */
    @RequestMapping("/findSomeProductByMap")
    @ResponseBody
    public List<LssgProduct> findSomeProductByMap(@RequestBody Map map){
        return impl.selectBySomeProductByMap(map);
    }

    @RequestMapping("/findSomeProductByProduct")
    @ResponseBody
    public List<LssgProduct> findSomeProductByProduct(){
        return impl.selectProductSmallPrice();
    }


    @RequestMapping("/findProductWithPage")
    @ResponseBody
    public PageInfo<LssgProduct> findProductWithPage(@RequestParam(value="productClassId",required = false)Integer productClassId,
                                                     @RequestParam(value = "shorts",required = false)Integer shorts,
                                                     @RequestParam("currentPage")Integer currentPage,@RequestParam("pageSize")Integer pageSize){
        Map map = new HashMap();
        if(productClassId!=null){
            map.put("productClassId",productClassId);
        }
        if(shorts!=null){
            map.put("shorts",shorts);
        }

        return impl.selectAllProductByMapWithPage(map,currentPage,pageSize);
    }


    @RequestMapping("/findOneProductByProductId")
    @ResponseBody
    public LssgProduct findOneProductByProductId(@RequestParam("productId")Integer productId){
        return impl.selectOneProductByProductId(productId);
    }


    @RequestMapping("/findAllProductByProductClassId")
    @ResponseBody
    public List<LssgProduct> findAllProductByProductClassId(@RequestParam("productClassId")Integer productClassId){
        return impl.selectAllProductByProductClassId(productClassId);
    }

    /**
     *
     * @param productId
     * @return
     */
    @RequestMapping("/findLikeSomeProduct")
    @ResponseBody
    public List<LssgProduct> findLikeSomeProduct(@RequestParam("productId")Integer productId){
        return impl.selectSomeLikeProduct(productId);
    }

    @RequestMapping("/findHotSomeProduct")
    @ResponseBody
    public List<LssgProduct> findHotSomeProduct(@RequestParam("productId")Integer productId){
        return impl.selectHotLikeProduct(productId);
    }

    @RequestMapping("/productCount")
    @ResponseBody
    public int productCount(){
        Map map = new HashMap();
        return impl.querySize(map);
    }

    @RequestMapping("/groupCount")
    @ResponseBody
    public Map<String,Object> groupCount(){
        Map map = new HashMap();
        List<CountEntity> countEntities = impl.groupCountSelect();
        List<Object> categorys = new ArrayList<Object>();
        for(int i=0;i<countEntities.size();i++){
            categorys.add(countEntities.get(i).getName());
        }
        map.put("countEntities",countEntities);
        map.put("categorys",categorys);
        return map;
    }

    @RequestMapping("/groupCountProduct")
    @ResponseBody
    public Map<String,Object> groupCountProduct(){
        Map map = new HashMap();
        List<CountEntity> countEntities = impl.countProduct();
        List<Object> categorys = new ArrayList<Object>();
        for(int i=0;i<countEntities.size();i++){
            categorys.add(countEntities.get(i).getName());
        }
        map.put("countEntities",countEntities);
        map.put("categorys",categorys);
        return map;
    }

    @RequestMapping("/groupCountProductClass")
    @ResponseBody
    public Map<String,Object> groupCountProductClass(){
        Map map = new HashMap();
        List<CountEntity> countEntities = impl.countProductAndClass();
        List<Object> categorys = new ArrayList<Object>();
        for(int i=0;i<countEntities.size();i++){
            categorys.add(countEntities.get(i).getName());
        }
        map.put("countEntities",countEntities);
        map.put("categorys",categorys);
        return map;
    }

    /**
     *
     * @return
     */
    @RequestMapping("/groupWeekProduct")
    @ResponseBody
    public Map<String,Object> groupWeekProduct(){
        Map map = new HashMap();
        List<Object> names = new ArrayList<Object>();
        String type = "line";
        List<CountEntity> countEntities0 = new ArrayList<CountEntity>();
        List<Object> daytimes = null;
        List<LssgProductClass> lssgProductClassList = lssgProductClassService.findByAll();
        for(LssgProductClass lssgProductClass :lssgProductClassList){
            CountEntity countEntity = new CountEntity();
            List<CountEntity> countEntities = impl.countProductByOneWeek(lssgProductClass.getProductClassId());
            Integer[] data = new Integer[7];
            daytimes = new ArrayList<Object>();
            for(int i=0;i<countEntities.size();i++){
                daytimes.add(DateUtils.dateToTime(countEntities.get(i).getDaytime()));
                data[i]=countEntities.get(i).getValue();
            }
            names.add(lssgProductClass.getProductClassName());
            countEntity.setData(data);
            countEntity.setType(type);
            countEntity.setName(lssgProductClass.getProductClassName());
            countEntities0.add(countEntity);
        }

        map.put("countEntities0",countEntities0);
        map.put("daytimes",daytimes);
        map.put("names",names);
        return map;
    }

    @RequestMapping("/findSomeProductByProductNameWithProductName")
    @ResponseBody
    public PageInfo<LssgProduct> findSomeProductByProductNameWithProductName(@RequestParam("currentPage")Integer currentPage,
                                                                             @RequestParam("pageSize")Integer pageSize,
                                                                             @RequestParam("query")String query){
        Map map = new HashMap();
        map.put("query",query);
        return impl.selectProductByProductNameWithPage(map,currentPage,pageSize);
    }
}
