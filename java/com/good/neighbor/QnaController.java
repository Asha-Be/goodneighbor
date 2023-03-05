package com.good.neighbor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import javax.servlet.http.HttpServletRequest;
import java.util.*;
import model.qna.QnaDTO;
import util.PageTest;

@RequestMapping("/qna")
@Controller
public class QnaController {
  @Autowired
  private SqlSession sqlsession;
  
  @RequestMapping("/insertForm.do")
  public String insertForm(Model model,HttpServletRequest request) {
    String qna_number=request.getParameter("qna_number");
    String qna_ref=request.getParameter("qna_ref");
    String qna_step=request.getParameter("qna_step");
    String qna_level=request.getParameter("qna_level");
    String pageNum=request.getParameter("pageNum");
    
    if(qna_number==null) {
      qna_number="0";
      qna_ref="1";
      qna_step="0";
      qna_level="0";
    }
    
    model.addAttribute("pageNum",pageNum);
    model.addAttribute("qna_number",qna_number);
    model.addAttribute("qna_ref",qna_ref);
    model.addAttribute("qna_step",qna_step);
    model.addAttribute("qna_level",qna_level);
    
    return ".main.qna.insertForm";
  }
  
  @RequestMapping(value="/insertPro.do",method=RequestMethod.POST)
  public String insertPro(HttpServletRequest request, QnaDTO qnaDTO) {
    
    int maxNum=0;
    if(sqlsession.selectOne("qna.qnaMax")!=null) {
      maxNum=sqlsession.selectOne("qna.qnaMax");
    }
    if(maxNum != 0) {
      maxNum=maxNum+1;
    } else {
      maxNum=1;
    }
    
    if(qnaDTO.getQna_number() != 0) {
      sqlsession.update("qna.Step",qnaDTO);
      qnaDTO.setQna_step(qnaDTO.getQna_step()+1);
      qnaDTO.setQna_level(qnaDTO.getQna_level()+1);
    } else {
      qnaDTO.setQna_ref(new Integer(maxNum));
      qnaDTO.setQna_step(new Integer(0));
      qnaDTO.setQna_level(new Integer(0));
    }
     sqlsession.insert("qna.insertQna",qnaDTO);
     return "redirect:/qna/list.do";
  }
  
  @RequestMapping("list.do")
  public String listQna(QnaDTO qnaDTO, Model model,
      @RequestParam(value="pageNum",required=false) String pageNum, HttpServletRequest request) {
    if(pageNum==null) {
      pageNum="1";
    }
    
    int cnt=sqlsession.selectOne("qna.countQna");
    int curPage=Integer.parseInt(pageNum);
    
    util.PageTest pt=new util.PageTest(cnt,curPage);
    
    int startline=pt.getStartRow()-1;
    
    Map<String, Object> map=new HashMap<String, Object>();
    map.put("start", new Integer(startline));
    map.put("count", new Integer(pt.getPageSize()));
    
    List<QnaDTO> list=sqlsession.selectList("qna.listQna",map);
    
    if(pt.getEndPage()>pt.getPageCnt()) {
      pt.setEndPage(pt.getPageCnt());
    }
    int number=cnt-(curPage-1)*pt.getPageSize();
    
    model.addAttribute("number",number);
    model.addAttribute("pageNum",pageNum);
    model.addAttribute("pt",pt);
    model.addAttribute("cnt",cnt);
    model.addAttribute("list",list);
    
    return ".main.qna.list";
  }
   
  @RequestMapping("content.do")
  public String Content(HttpServletRequest request,Model model) {
    String pageNum=request.getParameter("pageNum");
    int num=Integer.parseInt(request.getParameter("qna_number"));
    sqlsession.update("qna.cntQna",num);
    
    QnaDTO dto=sqlsession.selectOne("qna.oneSelect",num);
    model.addAttribute("dto",dto);
    model.addAttribute("pageNum",pageNum);
    
    return ".main.qna.content";
  }
  
  @RequestMapping("editForm.do")
  public String editForm(HttpServletRequest request, Model model) {
    String pageNum=request.getParameter("pageNum");
    int num=Integer.parseInt(request.getParameter("qna_number"));
    QnaDTO dto=sqlsession.selectOne("qna.oneSelect",num);
    
    model.addAttribute("dto",dto);
    model.addAttribute("num",num);
    model.addAttribute("pageNum",pageNum);
    
    return ".main.qna.editForm";
  }
  
  @RequestMapping(value="editPro.do",method=RequestMethod.POST)
  public String editPro(HttpServletRequest request, QnaDTO qnaDTO,Model model) {
    String pageNum=request.getParameter("pageNum");
    String pw=request.getParameter("qna_pw");
    sqlsession.update("qna.updateQna",qnaDTO);
    model.addAttribute("qna_pw",pw);
    model.addAttribute("pageNum",pageNum);
    model.addAttribute("qnaDTO",qnaDTO);
    
    return "redirect:/qna/list.do";
  }
  
  @RequestMapping("deleteForm.do")
  public String deleteForm(HttpServletRequest request, Model model) {
    String pageNum=request.getParameter("pageNum");
    int num=Integer.parseInt(request.getParameter("qna_number"));
    
    QnaDTO dto=sqlsession.selectOne("qna.oneSelect",num);
    
    model.addAttribute("pageNum",pageNum);
    model.addAttribute("dto",dto);
    
    return ".main.qna.deleteForm";
  }
  
  @RequestMapping(value="deletePro.do",method=RequestMethod.POST)
  public String deletePro(HttpServletRequest request, Model model) {
    int num=Integer.parseInt(request.getParameter("qna_number"));
    String pageNum=request.getParameter("pageNum");
    QnaDTO dto=sqlsession.selectOne("qna.oneSelect",num);
    sqlsession.delete("qna.deleteQna",num);
    model.addAttribute("pageNum",pageNum);
    model.addAttribute("dto",dto);
    
    return "redirect:/qna/list.do";
  }
  
}
